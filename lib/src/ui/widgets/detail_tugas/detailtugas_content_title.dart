import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:global_template/global_template.dart';
import 'package:my_provider/my_provider.dart';

class DetailTugasContentTitle extends ConsumerWidget {
  const DetailTugasContentTitle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final tugas = watch(tugasById);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        tugas.nameTugas,
        style: appTheme
            .headline5(context)
            .copyWith(fontWeight: FontWeight.w500, fontFamily: AppConfig.headerFont),
        textAlign: TextAlign.center,
      ),
    );
  }
}
