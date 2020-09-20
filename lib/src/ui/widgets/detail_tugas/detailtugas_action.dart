import 'package:flutter/material.dart';
import 'package:my_provider/my_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:global_template/global_template.dart';

import '../../screens/form_tugas_screen.dart';
import '../../../function/functions.dart';

class DetailTugasAction extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final tugas = watch(tugasById);
    return Positioned(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Wrap(
          alignment: WrapAlignment.center,
          spacing: 20,
          children: [
            ActionRoundedButton(
              size: 8,
              icon: Icon(Icons.delete, color: colorPallete.white),
              backgroundColor: colorPallete.red,
              onTap: () async {
                final ctx = context.read(GlobalContext).state;
                await CRUDFunction.CRUDdeleteTugas(ctx);
              },
            ),
            ActionRoundedButton(
              isVisible: tugas.statusTugas ? false : true,
              size: 8,
              icon: Icon(Icons.mode_edit, color: colorPallete.white),
              onTap: () async {
                context.read(TugasModelEdit).state = tugas;
                await Navigator.of(context).pushNamed(FormTugasScreen.routeNamed, arguments: tugas);
              },
            ),
            ActionRoundedButton(
              isVisible: tugas.statusTugas ? false : true,
              size: 8,
              icon: Icon(Icons.check, color: colorPallete.white),
              backgroundColor: colorPallete.green,
              onTap: () async =>
                  await CRUDFunction.CRUDupdateStatusTugas(context, idTugas: tugas.idTugas),
            ),
          ],
        ),
      ),
      bottom: sizes.height(context) / 20,
      left: 0,
      right: 0,
    );
  }
}
