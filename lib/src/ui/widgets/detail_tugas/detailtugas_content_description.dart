import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:global_template/global_template.dart';
import 'package:my_provider/my_provider.dart';

class DetailTugasContentDescription extends ConsumerWidget {
  const DetailTugasContentDescription({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final tugas = watch(tugasById);
    return Text(
      tugas.deskripsiTugas,
      style: appTheme
          .bodyText1(context)
          .copyWith(color: colorPallete.grey, fontWeight: FontWeight.w300),
      textAlign: TextAlign.left,
    );
  }
}
