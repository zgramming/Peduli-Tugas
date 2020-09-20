import 'package:flutter/material.dart';
import 'package:my_network/my_network.dart';
import 'package:my_provider/my_provider.dart';
import 'package:global_template/global_template.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../function/functions.dart';

import '../../screens/form_tugas_screen.dart';
import '../../screens/detail_tugas_screen.dart';

import './card_tugas_textrich.dart';

class CardTugas extends StatelessWidget {
  final TugasModel model;

  CardTugas(this.model);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12.0),
      child: ListTile(
        onTap: () async {
          context.read(IDTugas).state=model.idTugas;
          await Navigator.of(context).pushNamed(DetailTugasScreen.routeNamed);
        },
        contentPadding: const EdgeInsets.all(20.0),
        title: Text(model.nameTugas),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 10),
            CardTugasTextRich(title: 'Dosen', content: model.pelajaran.dosen.nameDosen),
            CardTugasTextRich(
                title: 'Jam', content: GlobalFunction.formatHoursMinutes(model.deadlineTugas)),
          ],
        ),
        trailing: IconButton(
          icon: Icon(Icons.more_vert),
          onPressed: () => showModalBottomSheet(
            context: context,
            builder: (context) => ActionModalBottomSheet(
              children: [
                ActionCircleButton(
                  isVisible: model.statusTugas ? false : true,
                  backgroundColor: colorPallete.green,
                  icon: Icons.done,
                  foregroundColor: colorPallete.white,
                  onTap: () async =>
                      await CRUDFunction.CRUDupdateStatusTugas(context, idTugas: model.idTugas),
                ),
              ],
              onDelete: () async {
                await CRUDFunction.CRUDdeleteTugas(context);
              },
              onEdit: () async {
                context.read(TugasModelEdit).state = model;
                await Navigator.of(context).pushNamed(FormTugasScreen.routeNamed, arguments: model);
              },
              typeAction: model.statusTugas ? TypeAction.Delete : TypeAction.DeleteAndEdit,
            ),
          ),
        ),
      ),
    );
  }
}
