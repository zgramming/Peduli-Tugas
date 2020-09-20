import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:global_template/global_template.dart';
import 'package:my_network/my_network.dart';
import 'package:my_provider/my_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ModalBottomSheetReminderPicker extends StatefulWidget {
  @override
  _ModalBottomSheetReminderPickerState createState() => _ModalBottomSheetReminderPickerState();
}

class _ModalBottomSheetReminderPickerState extends State<ModalBottomSheetReminderPicker> {
  TextEditingController reminderValueController;

  @override
  void initState() {
    super.initState();
    final formType = context.read(GlobalFormType).state;
    if (formType == FormType.IsFormTugas) {
      final modelEdit = context.read(TugasModelEdit).state;
      reminderValueController = modelEdit.idTugas == null
          ? TextEditingController()
          : TextEditingController(text: modelEdit.durationReminder.toString());
    } else {
      final modelEdit = context.read(PelajaranModelEdit).state;
      reminderValueController = modelEdit.idPelajaran == null
          ? TextEditingController()
          : TextEditingController(text: modelEdit.durationReminder.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(right: 12, left: 12, bottom: sizes.keyboardHeight(context)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            Consumer(
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
                      ? 'Jangan Ingatkan aku'
                      : 'Ingatkan $reminderValue ${reminderType.nameReminder} sebelum waktunya',
                  textAlign: TextAlign.center,
                  style: appTheme.caption(context).copyWith(fontWeight: FontWeight.bold),
                );
              },
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: TextFormFieldCustom(
                    controller: reminderValueController,
                    keyboardType: TextInputType.number,
                    inputFormatter: [
                      WhitelistingTextInputFormatter.digitsOnly,
                    ],
                    onChanged: (value) {
                      final formType = context.read(GlobalFormType).state;
                      if (value == null || value.isEmpty) {
                        print('masuk sini');
                        if (formType == FormType.IsFormTugas) {
                          context.read(TugasReminderValue).state = 1;
                        } else {
                          context.read(PelajaranReminderValue).state = 1;
                        }
                      } else {
                        if (formType == FormType.IsFormTugas) {
                          context.read(TugasReminderValue).state = int.tryParse(value);
                        } else {
                          context.read(PelajaranReminderValue).state = int.tryParse(value);
                        }
                      }
                    },
                    prefixIcon: null,
                    padding: const EdgeInsets.only(left: 15.0),
                  ),
                ),
                Flexible(
                  flex: 3,
                  fit: FlexFit.tight,
                  child: SizedBox(
                    height: sizes.height(context) / 8,
                    child: Consumer(
                      builder: (context, watch, _) {
                        final formType = watch(GlobalFormType).state;

                        final reminderType = formType == FormType.IsFormTugas
                            ? watch(TugasReminderType).state
                            : watch(PelajaranReminderType).state;

                        return PageView.builder(
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Text(
                                listReminder[index].nameReminder,
                                textAlign: TextAlign.center,
                              ),
                            );
                          },
                          scrollDirection: Axis.vertical,
                          controller: PageController(
                            viewportFraction: .4,
                            initialPage: reminderType == null ? 0 : reminderType.id,
                          ),
                          itemCount: listReminder.length,
                          onPageChanged: (value) {
                            final result = listReminder.firstWhere(
                              (element) => element.id == value,
                              orElse: () => null,
                            );
                            if (result != null) {
                              if (formType == FormType.IsFormTugas) {
                                context.read(TugasReminderType).state = result;
                              } else {
                                context.read(PelajaranReminderType).state = result;
                              }
                              if (result.reminderType == ReminderType.JanganIngkatkan) {
                                if (formType == FormType.IsFormTugas) {
                                  context.read(TugasReminderValue).state = 0;
                                } else {
                                  context.read(PelajaranReminderValue).state = 0;
                                }
                                reminderValueController.clear();
                              }
                            }
                          },
                        );
                      },
                    ),
                  ),
                ),
                Flexible(
                  flex: 3,
                  child: Text(
                    'Sebelum waktunya',
                    style: appTheme.caption(context),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
