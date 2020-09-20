import 'package:flutter/material.dart';
import 'package:my_network/my_network.dart';
import 'package:my_provider/my_provider.dart';
import 'package:global_template/global_template.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../screens/detail_tugas_screen.dart';

class TaskScreenTugas extends StatelessWidget {
  TaskScreenTugas({@required this.result});
  final TugasModel result;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListTile(
          title: Text(
            result.nameTugas,
            style: appTheme.bodyText1(context).copyWith(fontWeight: FontWeight.w400),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text.rich(
            TextSpan(
              text: 'Deadline : ',
              children: [
                TextSpan(
                  text: GlobalFunction.formatYearMonthDaySpecific(
                    result.deadlineTugas,
                  ),
                ),
                TextSpan(text: ' | ${GlobalFunction.formatHoursMinutes(result.deadlineTugas)}')
              ],
              style: appTheme.caption(context).copyWith(fontWeight: FontWeight.w300),
            ),
          ),
        ),
        Positioned.fill(
          child: Material(
            color: colorPallete.transparent,
            child: InkWell(
              onTap: () async {
                context.read(IDTugas).state = result.idTugas;
                await Navigator.of(context).pushNamed(DetailTugasScreen.routeNamed);
              },
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
            ),
          ),
        )
      ],
    );
  }
}
