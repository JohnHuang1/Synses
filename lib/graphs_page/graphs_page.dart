import 'dart:html';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GraphPage extends StatefulWidget {
  String title = '';
  GraphPage({Key? key, required this.title}) : super(key: key);

  State<GraphPage> createState() => GraphPageStat();
}

class GraphPageStat extends State<GraphPage> {
/*
List<IBSData> _chartData;

@override
void initState(){
  _chartData = getChartData()
  super.initState();
}
*/

/*
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Center(child: Text("GraphPage")),
    );
  }
*/

  List<IBSData> _chartData = [];

  @override
  void initState() {
    _chartData = getChartData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SfCartesianChart(
        title: ChartTitle(text: 'Factors & Severity'),

        series: <ChartSeries>[
          LineSeries<IBSData, double>(
              dataSource: _chartData,
              xValueMapper: (IBSData severity, _) => severity.factor,
              yValueMapper: (IBSData severity, _) => severity.severity,
              dataLabelSettings:
                  DataLabelSettings(isVisible: true, color: Colors.blue))
        ],
        primaryXAxis: NumericAxis(edgeLabelPlacement: EdgeLabelPlacement.shift),
        // primaryYAxis: NumericAxis(
        // numberFormat: NumberFormat.simpleCurrency(decimalDigits: 0)),
      ),
    ));
  }

  List<IBSData> getChartData() {
    final List<IBSData> chartData = [
      IBSData(2, 3),
      IBSData(3, 6),
      IBSData(4, 9),
      IBSData(6, 5),
      IBSData(7, 1)
    ];
    return chartData;
  }
}

class IBSData {
  IBSData(this.factor, this.severity);
  final double factor;
  final double severity;
}
