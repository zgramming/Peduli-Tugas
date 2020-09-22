import 'package:flutter/material.dart';
import 'package:my_provider/my_provider.dart';
import 'package:global_template/global_template.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TaskScreenDate extends StatelessWidget {
  const TaskScreenDate({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            InkWell(
              onTap: () {
                final now = context.read(GlobalDateNowYMD).state;
                context.read(GlobalDateNowYMD).state = now.subtract(Duration(days: 7));
              },
              child: Icon(Icons.chevron_left),
            ),
            Expanded(
              child: Consumer(
                builder: (context, watch, _) {
                  final now = watch(GlobalDateNowYMD).state;
                  final next7Day =
                      GlobalFunction.formatYearMonthDay(watch(Global7NextDayYMD).state, type: 2);
                  return Text.rich(
                    TextSpan(
                      text: 'List tugas ',
                      children: [
                        TextSpan(text: now.day.toString()),
                        TextSpan(text: ' - '),
                        TextSpan(text: next7Day),
                      ],
                    ),
                    textAlign: TextAlign.center,
                    style: appTheme.caption(context),
                  );
                },
              ),
            ),
            InkWell(
              onTap: () {
                final now = context.read(GlobalDateNowYMD).state;
                context.read(GlobalDateNowYMD).state = now.add(Duration(days: 7));
              },
              child: Icon(Icons.chevron_right),
            ),
          ],
        ),
      ),
    );
  }
}
