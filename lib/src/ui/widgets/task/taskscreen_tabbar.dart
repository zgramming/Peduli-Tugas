import 'package:flutter/material.dart';
import 'package:my_provider/my_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:global_template/global_template.dart';

import './taskscreen_card.dart';

class TaskScreenTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (ctx, watch, _) {
      final groupedTugas = watch(TPgroupedByDay(true)) as List<DateTime>;

      if (groupedTugas == null || groupedTugas.isEmpty) {
        return Center(child: Text('Tidak ada tugas minggu ini'));
      }
      return DefaultTabController(
        length: groupedTugas.length,
        child: Scaffold(
          appBar: TabBarWithoutAppBar(
            colorTabBar: colorPallete.primaryColor,
            tabBar: TabBar(
              isScrollable: groupedTugas.length > 4 ? true : false,
              tabs: groupedTugas
                  .map(
                    (hari) => Tab(
                      text: GlobalFunction.formatDay(hari),
                    ),
                  )
                  .toList(),
            ),
          ),
          body: TabBarView(
            children: groupedTugas.map((deadline) {
              final tugas = watch(TPbyDeadline(deadline));

              if (tugas == null || tugas.isEmpty) {
                return Center(child: Text('Tugas minggu ini tidak ada'));
              }
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: kToolbarHeight + sizes.height(context) / 25),
                    ...tugas
                        .map(
                          (keyPelajaran, valueTugas) => MapEntry(
                            keyPelajaran,
                            TaskScreenCard(keyPelajaran: keyPelajaran, valueTugas: valueTugas),
                          ),
                        )
                        .values
                        .toList(),
                    SizedBox(height: kToolbarHeight),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      );
    });
  }
}
