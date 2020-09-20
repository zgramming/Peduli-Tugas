import 'package:flutter/material.dart';
import 'package:my_network/my_network.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class HomeScreenPieChart extends StatelessWidget {
  final List<PieChartModel> data;
  HomeScreenPieChart({@required this.data});
  @override
  Widget build(BuildContext context) {
    var series = <charts.Series<PieChartModel, String>>[
      charts.Series<PieChartModel, String>(
        id: 'Statistik Tugas',
        data: data,
        domainFn: (datum, _) => datum.title,
        measureFn: (datum, _) => datum.total,
        // colorFn: (datum, index) => charts.ColorUtil.fromDartColor(GlobalFunction.getRandomColor()),
        // seriesColor: charts.ColorUtil.fromDartColor(colorPallete.red),
        // areaColorFn: (datum, index) => charts.ColorUtil.fromDartColor(colorPallete.red),
        // fillColorFn: (datum, index) => ,
        // seriesCategory: 'SADSADSAD',
      ),
    ];

    return charts.PieChart(
      series,
      animate: true,
      behaviors: [
        charts.DatumLegend(
          // Positions for "start" and "end" will be left and right respectively
          // for widgets with a build context that has directionality ltr.
          // For rtl, "start" and "end" will be right and left respectively.
          // Since this example has directionality of ltr, the legend is
          // positioned on the right side of the chart.
          position: charts.BehaviorPosition.end,
          // By default, if the position of the chart is on the left or right of
          // the chart, [horizontalFirst] is set to false. This means that the
          // legend entries will grow as  rows first instead of a  column.
          horizontalFirst: false,
          // This defines the padding around each legend entry.
          cellPadding: EdgeInsets.only(right: 20.0, bottom: 4.0),
          // Set [showMeasures] to true to display measures in series legend.
          showMeasures: true,
          // Configure the measure value to be shown by default in the legend.
          legendDefaultMeasure: charts.LegendDefaultMeasure.firstValue,
          // Optionally provide a measure formatter to format the measure value.
          // If none is specified the value is formatted as a decimal.
        ),
      ],
    );
  }
}
