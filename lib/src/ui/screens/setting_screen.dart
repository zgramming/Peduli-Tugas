import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:global_template/global_template.dart';
import 'package:my_provider/my_provider.dart';

import '../../function/functions.dart';

import '../widgets/custom_expansiontile.dart';
import '../widgets/setting/custom_listtile.dart';
import '../widgets/setting/dialog_progress_exportimport.dart';

import './edit_screen.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          AppBar(
            centerTitle: true,
            title: Text(
              'Pengaturan',
              style: TextStyle(
                fontFamily: AppConfig.headerFont,
              ),
            ),
          ),
          SizedBox(height: 20),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    'Utama',
                    style: appTheme.subtitle1(context).copyWith(
                          color: colorPallete.grey,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  SizedBox(height: 10),
                  CustomExpansionTile(
                    leading: Icon(Icons.supervised_user_circle),
                    title: 'Dosen',
                    subtitle: 'Ubah dosen',
                    onPressedEdit: () => Navigator.of(context).pushNamed(
                      EditScreen.routeNamed,
                      arguments: AppConfig.MENU_DOSEN,
                    ),
                  ),
                  CustomExpansionTile(
                    leading: Icon(Icons.book),
                    title: 'Pelajaran',
                    subtitle: 'Ubah pelajaran ',
                    onPressedEdit: () => Navigator.of(context).pushNamed(
                      EditScreen.routeNamed,
                      arguments: AppConfig.MENU_PELAJARAN,
                    ),
                  ),
                  SizedBox(height: 10),
                  Consumer(
                    builder: (context, watch, _) {
                      final isDarkMode = watch(GlobalIsDarkMode).state;
                      return CustomListTile(
                        leading: AnimatedSwitcher(
                          duration: Duration(seconds: 1),
                          child: isDarkMode
                              ? Icon(Icons.brightness_3)
                              : Icon(Icons.wb_sunny, key: UniqueKey()),
                        ),
                        title: 'Tema',
                        subtitle: 'Ubah tampilan aplikasi (Gelap/Terang)',
                        trailing: Switch.adaptive(
                          value: isDarkMode,
                          onChanged: (value) async {
                            context.read(GlobalIsDarkMode).state = value;
                            await CommonFunction.setDarkMode(value);
                          },
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 20),
                  CustomListTile(
                    leading: Icon(Icons.import_export),
                    title: 'Export & Import',
                    subtitle: 'Bagikan data ke temanmu',
                    onTap: () async => await showModalBottomSheet(
                      context: context,
                      builder: (context) => Container(
                        padding: const EdgeInsets.all(20.0),
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          spacing: 10,
                          children: [
                            ActionRoundedButton(
                              icon: Icon(Icons.file_upload, color: colorPallete.white),
                              size: 5,
                              title: 'Export',
                              foregroundColor: colorPallete.white,
                              backgroundColor: colorPallete.primaryColor,
                              onTap: () async => await CRUDFunction.exportData(
                                context,
                                onExportProgress: (totalDataExport) async => await showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (context) => DialogProgressExportImport(
                                    totalData: totalDataExport,
                                    exportOrImport: ExportOrImport.Export,
                                  ),
                                ),
                              ),
                            ),
                            ActionRoundedButton(
                              icon: Icon(Icons.file_download, color: colorPallete.white),
                              size: 5,
                              title: 'Import',
                              foregroundColor: colorPallete.white,
                              backgroundColor: colorPallete.green,
                              onTap: () async => await CRUDFunction.importData(
                                context,
                                onProgressImport: (totalData) async => await showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (context) =>
                                      DialogProgressExportImport(totalData: totalData),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
