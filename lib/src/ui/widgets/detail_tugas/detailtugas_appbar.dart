import 'package:flutter/material.dart';
import 'package:my_provider/my_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailTugasAppbar extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final tugas = watch(tugasById);
    return Positioned(
      child: AppBar(title: Text(tugas.pelajaran.namePelajaran)),
      top: 0,
      left: 0,
      right: 0,
    );
  }
}
