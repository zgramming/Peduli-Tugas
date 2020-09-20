import 'package:flutter/material.dart';
import 'package:my_provider/my_provider.dart';
import 'package:global_template/global_template.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DatePicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: OutlineButton(
          borderSide: BorderSide(color: colorPallete.accentColor),
          child: FittedBox(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Consumer(builder: (ctx, watch, _) {
              final date = watch(TugasSelectedDate).state;
              return Text(
                (date == null)
                    ? 'Pilih Tanggal'
                    : '${GlobalFunction.formatYearMonthDaySpecific(date)}',
                style: appTheme
                    .button(context)
                    .copyWith(color: colorPallete.accentColor, fontWeight: FontWeight.bold),
              );
            }),
          )),
          onPressed: () async {
            final now = DateTime.now();
            final datePicker = await showDatePicker(
              context: context,
              initialDate: now,
              firstDate: now,
              lastDate: DateTime(2100),
            );
            if (datePicker != null) {
              context.read(TugasSelectedDate).state = datePicker;
            }
          },
        ),
      ),
    );
  }
}
