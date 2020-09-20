import 'package:flutter/material.dart';
import 'package:my_network/my_network.dart';
import 'package:global_template/global_template.dart';

import '../widgets/edit_screen/pelajaran_by_semester.dart';
import '../widgets/custom_expansiontile.dart';
import '../widgets/grouped_dosen.dart';

class EditScreen extends StatelessWidget {
  final String menuEdit;
  EditScreen(this.menuEdit);
  static const routeNamed = '/edit-screen';
  @override
  Widget build(BuildContext context) {
    if (menuEdit == AppConfig.MENU_DOSEN) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Menu Ubah Dosen'),
        ),
        body: GroupedDosen(),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            menuEdit == AppConfig.MENU_PELAJARAN ? 'Menu Ubah Pelajaran' : 'Menu Ubah Tugas',
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: listSemester
                  .map(
                    (semester) => Column(
                      children: [
                        CustomExpansionTile(
                          title: semester.nameSemester,
                          leading: CircleAvatar(
                            foregroundColor: colorPallete.accentColor,
                            child: FittedBox(
                              child: Text(
                                '${semester.idSemester}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          titleAlign: TextAlign.center,
                          parentMenu: <Widget>[
                            PelajaranBySemester(semester: semester),
                          ],
                        ),
                        Divider(thickness: 2),
                      ],
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      );
    }
  }
}
