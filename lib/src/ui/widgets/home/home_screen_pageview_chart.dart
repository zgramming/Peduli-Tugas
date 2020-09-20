import 'package:flutter/material.dart';
import 'package:my_provider/my_provider.dart';
import 'package:global_template/global_template.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import './home_barchart.dart';
import './home_piechart.dart';

import '../../widgets/task/taskscreen_date.dart';

class HomeScreenPageViewChart extends StatelessWidget {
  static const double dotSize = 10.0;
  final controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            itemBuilder: (context, index) {
              if (index == 0) {
                return Card(
                  color: colorPallete.accentColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        TaskScreenDate(),
                        Expanded(
                          child: Consumer(
                            builder: (context, watch, _) {
                              final chart = watch(TPbarchart);
                              if (chart == null || chart.isEmpty) {
                                return Center(child: Text('Tugas Minggu Ini Tidak Ada'));
                              }
                              return HomeScreenBarChart(data: chart);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return Card(
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Text('Total Statistik Tugas',
                          style: appTheme
                              .subtitle1(context)
                              .copyWith(fontFamily: AppConfig.headerFont)),
                      Expanded(
                        child: Consumer(builder: (context, watch, _) {
                          final chart = watch(TPpiechart);
                          if (chart == null || chart.isEmpty) {
                            return Center(child: Text('Tugas kamu masih kosong'));
                          }
                          return HomeScreenPieChart(data: chart);
                        }),
                      ),
                    ],
                  ),
                );
              }
            },
            itemCount: 2,
            controller: controller,
            allowImplicitScrolling: true,
          ),
        ),
        SizedBox(height: 5),
        SmoothPageIndicator(
          controller: controller,
          effect: WormEffect(dotWidth: dotSize, dotHeight: dotSize),
          count: 2,
          onDotClicked: (index) => controller.animateToPage(
            index,
            duration: kThemeAnimationDuration,
            curve: Curves.decelerate,
          ),
        ),
      ],
    );
  }
}
