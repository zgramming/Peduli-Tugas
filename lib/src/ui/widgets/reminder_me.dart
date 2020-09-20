import 'package:flutter/material.dart';
import 'package:my_provider/my_provider.dart';
import 'package:global_template/global_template.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import './modalbottomsheet_reminderpicker.dart';

class ReminderMe extends StatelessWidget {
  const ReminderMe({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      onPressed: () async => showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => ModalBottomSheetReminderPicker(),
      ),
      child: Consumer(
        builder: (context, watch, _) {
          final formType = watch(GlobalFormType).state;

          final reminderType = formType == FormType.IsFormTugas
              ? watch(TugasReminderType).state
              : watch(PelajaranReminderType).state;

          final reminderValue = formType == FormType.IsFormTugas
              ? watch(TugasReminderValue).state
              : watch(PelajaranReminderValue).state;

          return Text(
            reminderType == null || reminderType.id == 0
                ? 'Jangan Ingatkan'
                : 'Ingatkan $reminderValue ${reminderType.nameReminder} sebelum waktunya',
            textAlign: TextAlign.center,
            style: appTheme.caption(context).copyWith(fontWeight: FontWeight.bold),
          );
        },
      ),
    );
  }
}
