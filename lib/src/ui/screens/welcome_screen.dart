import 'package:flutter/material.dart';
import 'package:my_network/my_network.dart';
import 'package:my_provider/my_provider.dart';
import 'package:global_template/global_template.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import './home_screen.dart';
import './task_screen.dart';
import './setting_screen.dart';
import './form_dosen_screen.dart';
import './form_tugas_screen.dart';
import './form_pelajaran_screen.dart';

import '../widgets/welcome_screen/modalbottomsheet_adding_option.dart';

class WelcomeScreen extends StatelessWidget {
  static const routeNamed = '/welcome-screen';

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (ctx, watch, _) {
        final tugas = watch(showAllTugas);
        final pelajaran = watch(showAllPelajaran);
        final dosen = watch(showAllDosen);
        if (tugas is AsyncError || pelajaran is AsyncError || dosen is AsyncError) {
          return Scaffold(body: Center(child: Text('Error Found')));
        } else if (tugas is AsyncLoading || pelajaran is AsyncLoading || dosen is AsyncLoading) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        }
        return BottomNavigationBarCustom(
          unselectedItemsColor: colorPallete.white.withOpacity(.5),
          selectedItemsColor: colorPallete.accentColor,
          unSelectedLabelStyle: appTheme.caption(context),
          selectedLabelStyle: appTheme.caption(context),
          floatingActionButton: FloatingActionButton(
            onPressed: () async => await showModalBottomSheet(
              context: context,
              builder: (context) => Container(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 10,
                  children: [
                    ModalBottomSheetAddingOption(
                      icon: Icons.person,
                      title: 'Dosen',
                      onTap: () async {
                        context.read(DosenModelEdit).state = DosenModel();
                        await Navigator.of(context).pushNamed(FormDosenScreen.routeNamed);
                      },
                    ),
                    ModalBottomSheetAddingOption(
                      icon: Icons.book,
                      title: 'Pelajaran',
                      onTap: () async {
                        context.read(PelajaranModelEdit).state = PelajaranModel();
                        await Navigator.of(context).pushNamed(FormPelajaranScreen.routeNamed);
                      },
                    ),
                    ModalBottomSheetAddingOption(
                      icon: Icons.work,
                      title: 'Tugas',
                      onTap: () async {
                        context.read(TugasModelEdit).state = TugasModel();
                        await Navigator.of(context).pushNamed(FormTugasScreen.routeNamed);
                      },
                    ),
                  ],
                ),
              ),
            ),
            child: Icon(Icons.add),
          ),
          iconBottomNavigation: <Widget>[
            Icon(Icons.home),
            Stack(
              overflow: Overflow.visible,
              children: [
                Icon(Icons.calendar_today),
                Positioned(
                  child: Consumer(
                    builder: (context, watch, _) {
                      final groupedTugas = watch(TPgroupedByDay(false)) as List<TugasModel>;
                      if (groupedTugas == null) {
                        return SizedBox();
                      }
                      final totalTugasProgress = groupedTugas
                          .where((element) => element.statusTugas == false)
                          .toList()
                          .length;
                      return Visibility(
                        child: CircleAvatar(
                          radius: 8,
                          backgroundColor: colorPallete.red,
                          foregroundColor: colorPallete.white,
                          child: FittedBox(
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text('$totalTugasProgress',
                                  style: TextStyle(fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  top: -4,
                  right: -8,
                ),
              ],
            ),
            Icon(Icons.settings),
          ],
          screens: <Widget>[
            HomeScreen(),
            TaskScreen(),
            SettingScreen(),
          ],
          titleBottomNavigation: <Widget>[
            Text('Beranda'),
            Text('Tugas'),
            Text('Pengaturan'),
          ],
          totalScreen: 3,
        );
      },
    );
  }
}
