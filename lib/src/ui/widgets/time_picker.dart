import 'package:flutter/material.dart';
import 'package:my_provider/my_provider.dart';
import 'package:global_template/global_template.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TimePicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      borderSide: BorderSide(color: colorPallete.accentColor),
      child: FittedBox(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer(
            builder: (ctx, watch, _) {
              final formType = watch(GlobalFormType).state;

              final time = formType == FormType.IsFormTugas
                  ? watch(TugasSelectedTime).state
                  : watch(PelajaranSelectedTime).state;

              return Text(
                (time == null) ? 'Pilih Jam' : '${time.hour}:${time.minute}',
                style: appTheme
                    .button(context)
                    .copyWith(color: colorPallete.accentColor, fontWeight: FontWeight.bold),
              );
            },
          ),
        ),
      ),
      onPressed: () async {
        final timePicker = await showTimePicker(context: context, initialTime: TimeOfDay.now());
        if (timePicker != null) {
          final formType = context.read(GlobalFormType).state;
          if (formType == FormType.IsFormTugas) {
            context.read(TugasSelectedTime).state = timePicker;
          } else {
            context.read(PelajaranSelectedTime).state = timePicker;
          }
        }
      },
    );
  }
}
