import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:synses/data/entry.dart';
import 'package:synses/shared/boxes.dart';

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


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box<Entry>>(
        valueListenable: Boxes.getEntries().listenable(),
        builder: (context, box, _) {
          return buildContent(box);
        });
  }

  Widget buildContent(Box<Entry> box) {
    return SafeArea(
      child: Scaffold(
        body: SfCartesianChart(
          title: ChartTitle(text: 'Factors & Severity'),

          series: <ChartSeries>[
            LineSeries<IBSData, double>(
                dataSource: getChartData(box),
                xValueMapper: (IBSData severity, _) => severity.factor,
                yValueMapper: (IBSData severity, _) => severity.severity,
                dataLabelSettings:
                    DataLabelSettings(isVisible: true, color: Colors.blue))
          ],
          primaryXAxis:
              NumericAxis(edgeLabelPlacement: EdgeLabelPlacement.shift),
          // primaryYAxis: NumericAxis(
          // numberFormat: NumberFormat.simpleCurrency(decimalDigits: 0)),
        ),
      ),
    );
  }

  List<IBSData> getChartData(Box<Entry> box) {
    // final List<IBSData> chartData = [
    //   IBSData(2, 3),
    //   IBSData(3, 6),
    //   IBSData(4, 9),
    //   IBSData(6, 5),
    //   IBSData(7, 1)
    // ];
    int index = 0;
    List<IBSData> data = box.values
        .where((element) => element.getEntryType() == 'Sleep')
        .map((e) => IBSData((index++).toDouble(), e.timeSlept!))
        .toList();

    // print("length = ${data.length}");
    // data.forEach((element) {print("data: ${element.factor} | ${element.severity}");});

    return data;
  }
}

class IBSData {
  IBSData(this.factor, this.severity);

  final double factor;
  final double severity;
}
