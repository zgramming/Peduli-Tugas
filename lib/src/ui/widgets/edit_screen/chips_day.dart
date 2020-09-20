import 'package:flutter/material.dart';
import 'package:my_network/my_network.dart';
import 'package:global_template/global_template.dart';

class ChipsDayPelajaran extends StatelessWidget {
  final PelajaranModel result;
  ChipsDayPelajaran(this.result);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      children: result.hari
          .map(
            (e) => Transform.scale(
              scale: .8,
              child: Chip(
                label: Text(
                  e.nameDay,
                  style: appTheme.caption(context).copyWith(
                        color: colorPallete.white,
                      ),
                ),
                backgroundColor: Color(e.codeColor),
              ),
            ),
          )
          .toList(),
    );
  }
}
