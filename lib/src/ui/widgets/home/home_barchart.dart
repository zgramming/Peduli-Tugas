import 'package:flutter/material.dart';
import 'package:my_network/my_network.dart';
import 'package:global_template/global_template.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class HomeScreenBarChart extends StatelessWidget {
  final List<BarChartModel> data;
  HomeScreenBarChart({@required this.data});
  @override
  Widget build(BuildContext context) {
    var series = <charts.Series<BarChartModel, String>>[
      charts.Series(
        id: 'tugas',
        data: data,
        domainFn: (model, _) => GlobalFunction.formatDay(model.date, type: 1),
        measureFn: (model, _) => model.totalTugas,
        colorFn: (model, _) {
          Color color;
          if (model.totalSelesai == model.totalTugas) {
            color = colorPallete.green;
          } else {
            color = colorPallete.primaryColor;
          }
          return charts.ColorUtil.fromDartColor(color);
        },
        labelAccessorFn: (model, _) => '${model.totalTugas}',
      ),
    ];
    return charts.BarChart(
      series,
      animate: true,
      barRendererDecorator: charts.BarLabelDecorator<String>(),
      domainAxis: charts.OrdinalAxisSpec(),
      defaultRenderer: charts.BarRendererConfig(
        cornerStrategy: const charts.ConstCornerStrategy(30),
      ),
    );
  }
}
