import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:global_template/global_template.dart';
import 'package:my_provider/my_provider.dart';

class DetailTugasContentLeftInfo extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final tugas = watch(tugasById);
    return Flexible(
      flex: 2,
      fit: FlexFit.tight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text.rich(
            TextSpan(
              style: appTheme
                  .caption(context)
                  .copyWith(color: colorPallete.grey, fontWeight: FontWeight.w500),
              text: 'Dosen : ',
              children: [
                TextSpan(
                  text: tugas.pelajaran.dosen.nameDosen,
                  style: TextStyle(
                    color: colorPallete.primaryColor,
                    decoration: TextDecoration.underline,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 5),
          DefaultTextStyle(
            style: appTheme.caption(context),
            child: Row(
              children: [
                Text('Status : '),
                CircleAvatar(
                  backgroundColor:
                      tugas.statusTugas ? colorPallete.green : colorPallete.accentColor,
                  maxRadius: sizes.width(context) / 30,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
