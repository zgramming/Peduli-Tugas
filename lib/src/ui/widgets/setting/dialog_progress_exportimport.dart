import 'package:flutter/material.dart';
import 'package:my_provider/my_provider.dart';
import 'package:global_template/global_template.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

enum ExportOrImport { Export, Import }

class DialogProgressExportImport extends StatelessWidget {
  DialogProgressExportImport({
    @required this.totalData,
    this.exportOrImport = ExportOrImport.Import,
  });
  final int totalData;
  final ExportOrImport exportOrImport;

  @override
  Widget build(BuildContext context) {
    String title;
    switch (exportOrImport) {
      case ExportOrImport.Import:
        title = 'Proses Import';
        break;
      case ExportOrImport.Export:
        title = 'Proses Export';
        break;
    }
    return WillPopScope(
      onWillPop: () async => false,
      child: SimpleDialog(
        title: Container(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(title, style: appTheme.headline6(context)),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: colorPallete.grey),
            ),
          ),
        ),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ActionRoundedButton(
                foregroundColor: colorPallete.white,
                size: 5,
                icon: Text(
                  '$totalData',
                  style: appTheme
                      .headline1(context)
                      .copyWith(color: colorPallete.white, fontWeight: FontWeight.bold),
                ),
                title: 'Total ',
              ),
              ActionRoundedButton(
                foregroundColor: colorPallete.white,
                size: 5,
                icon: Consumer(
                  builder: (context, watch, _) {
                    final progressImport = watch(GlobalProgressImport).state;
                    final progressExport = watch(GlobalProgressExport).state;
                    final result =
                        exportOrImport == ExportOrImport.Import ? progressImport : progressExport;
                    return Text(
                      '$result',
                      style: appTheme
                          .headline1(context)
                          .copyWith(color: colorPallete.white, fontWeight: FontWeight.bold),
                    );
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Consumer(
              builder: (context, watch, _) {
                final progressImport = watch(GlobalProgressImport).state;
                final progressExport = watch(GlobalProgressExport).state;

                final result =
                    exportOrImport == ExportOrImport.Import ? progressImport : progressExport;

                final percentacerResult = exportOrImport == ExportOrImport.Import
                    ? (progressImport * 100) / totalData
                    : (progressExport * 100) / totalData;

                return AnimatedSwitcher(
                  duration: Duration(seconds: 1),
                  switchInCurve: Curves.elasticIn,
                  switchOutCurve: Curves.elasticInOut,
                  child: totalData != result
                      ? LinearProgressIndicator(
                          value: percentacerResult / 100,
                          backgroundColor: colorPallete.accentColor,
                          valueColor: AlwaysStoppedAnimation<Color>(colorPallete.green),
                        )
                      : Align(
                          alignment: Alignment.centerRight,
                          child: OutlineButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text('Selesai'),
                          ),
                        ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
