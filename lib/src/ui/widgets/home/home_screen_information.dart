import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_provider/my_provider.dart';

import './home_screen_information_list.dart';

class HomeScreenInformation extends ConsumerWidget {
  const HomeScreenInformation({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final totTugas = watch(totalAllTugas);
    final totDosen = watch(totalAllDosen);
    final totPelajaran = watch(totalAllPelajaran);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        totDosen.when(
          data: (value) => HomeScreenInformationList(
              title: 'Total Dosen', content: '$value', icon: Icons.person),
          loading: () => Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => Center(
            child: Text(error.toString()),
          ),
        ),
        SizedBox(height: 10),
        totPelajaran.when(
          data: (value) => HomeScreenInformationList(
              title: 'Total Pelajaran', content: '$value', icon: Icons.book),
          loading: () => Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => Center(
            child: Text(error.toString()),
          ),
        ),
        SizedBox(height: 10),
        totTugas.when(
          data: (value) =>
              HomeScreenInformationList(title: 'Total Tugas', content: '$value', icon: Icons.work),
          loading: () => Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => Center(
            child: Text(error.toString()),
          ),
        ),
      ],
    );
  }
}
