import 'package:flutter/material.dart';
import 'package:my_network/my_network.dart';
import 'package:my_provider/my_provider.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:global_template/global_template.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/tugasby_pelajaran/card_tugas.dart';

class TugasByPelajaranScreen extends StatelessWidget {
  static const routeNamed = '/tugas-by-pelajaran-screen';
  final PelajaranModel model;
  TugasByPelajaranScreen(this.model);
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (ctx, watch, _) {
      final result = watch(groupedTugasByStatus(model.idPelajaran));
      if (result == null || result.isEmpty) {
        return Scaffold(appBar: AppBar(), body: Center(child: Text('Tugas Tidak Ditemukan')));
      }
      return DefaultTabController(
        length: result.length,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('Tugas ${model.namePelajaran}'),
            bottom: TabBar(
              tabs: result.map(
                (status) {
                  final totalTugas =
                      watch(tugasByPelajaranAndStatus([model.idPelajaran, status, 0]));
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Wrap(
                      spacing: 5,
                      children: [
                        Text(status ? 'Selesai' : 'On Progress'),
                        CircleAvatar(child: FittedBox(child: Text('$totalTugas')), radius: 10)
                      ],
                    ),
                  );
                },
              ).toList(),
            ),
          ),
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: result.map(
              (status) {
                final tugasDetail =
                    watch(tugasByPelajaranAndStatus([model.idPelajaran, status, 1]));

                return GroupedListView<TugasModel, DateTime>(
                  elements: tugasDetail,
                  order: GroupedListOrder.DESC,
                  groupBy: (element) => DateTime(
                    element.deadlineTugas.year,
                    element.deadlineTugas.month,
                    element.deadlineTugas.day,
                  ),
                  groupSeparatorBuilder: (value) => Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 20.0),
                    child: Text(
                      GlobalFunction.formatYearMonthDaySpecific(value),
                      style: appTheme.subtitle1(context).copyWith(
                            color: colorPallete.grey,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  indexedItemBuilder: (_, element, index) => CardTugas(element),
                );
              },
            ).toList(),
          ),
        ),
      );
    });
  }
}
