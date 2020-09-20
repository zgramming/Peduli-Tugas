import 'package:flutter/material.dart';
import 'package:my_provider/my_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:global_template/global_template.dart';

class DetailTugasContentRightInfo extends ConsumerWidget {
  const DetailTugasContentRightInfo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final tugas = watch(tugasById);
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Deadline',
            style: appTheme.bodyText1(context).copyWith(color: colorPallete.grey),
          ),
          SizedBox(height: 5),
          FittedBox(
            child: Text(
              GlobalFunction.formatYearMonthDaySpecific(
                tugas.deadlineTugas,
                type: 2,
              ),
              style: appTheme.caption(context).copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
      fit: FlexFit.tight,
    );
  }
}
