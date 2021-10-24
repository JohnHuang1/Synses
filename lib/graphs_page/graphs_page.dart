import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
  List<String> labels = [
    'Sleep',
    'Bathroom',
    'Mood',
    'Exercise',
    'Diet',
    "IBS Intensity",
    'Hydration'
  ];
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box<Entry>>(
        valueListenable: Boxes.getEntries().listenable(),
        builder: (context, box, _) {
          return SafeArea(
            child: Scaffold(
              body: Column(
                children: [Expanded(child: getChart(box)), getBottomNavBar()],
              ),
            ),
          );
        });
  }

  Widget getChart(Box<Entry> box) {
    return SfCartesianChart(
      title: ChartTitle(text: 'Factors & Severity'),

      series: getChartData(box),
      primaryXAxis: NumericAxis(edgeLabelPlacement: EdgeLabelPlacement.shift),
      // primaryYAxis: NumericAxis(
      // numberFormat: NumberFormat.simpleCurrency(decimalDigits: 0)),
    );
  }

  List<LineSeries<IBSData, double>> getChartData(Box<Entry> box) {
    // List<IBSData> data = box.values
    //     .where((element) => element.getEntryType() == labels[_selectedIndex])
    //     .map((e) => IBSData((index++).toDouble(), e.getEntryValues()[0]))
    //     .toList();
    Iterable<Entry> data = box.values
        .where((element) => element.getEntryType() == labels[_selectedIndex]);

    List<LineSeries<IBSData, double>> vals = List.empty(growable: true);
    
    List<MaterialColor> colors = [Colors.blue, Colors.red, Colors.green, Colors.purple, Colors.cyan, Colors.pink];

    for(int i = 0; i < (data.first.getEntryValues()).length; i++){
      int index = 0;
      vals.add(LineSeries<IBSData, double>(
          dataSource: data.map((e) => IBSData((index++).toDouble(), e.getEntryValues()[i])).toList(),
          xValueMapper: (IBSData severity, _) => severity.factor,
          yValueMapper: (IBSData severity, _) => severity.severity,
          dataLabelSettings:
          DataLabelSettings(isVisible: true, color: colors[i])));
    }

    return vals;
  }

  Widget getBottomNavBar() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: labels
          .map(
            (e) => Container(
              height: 50,
              child: InkWell(
                highlightColor: labels.indexOf(e) == _selectedIndex ? Colors.lightBlueAccent: null,
                onTap: () {
                  setState(() {
                    _selectedIndex = labels.indexOf(e);
                  });
                },
                child: Column(children: [
                  getIcon(e)!,
                  Flexible(
                    child: Text(e),
                  )
                ]),
              ),
            ),
          )
          .toList(),
    );
  }

  void onChartChange(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget? getIcon(val) {
    print('val = $val');
    Widget? icon;
    switch (val) {
      case Entry.sleepString:
        icon = SvgPicture.asset("images/sleep.svg");
        // icon = ImageIcon(AssetImage('images/sleep.svg'));
        break;
      case Entry.bathroomString:
        // icon = SvgPicture.asset("images/bathroom.svg");
        icon = ImageIcon(AssetImage('images/toilet.png'));
        break;
      case Entry.moodString:
        icon = SvgPicture.asset("images/mood.svg");
        // icon = ImageIcon(AssetImage('images/mood.svg'));
        break;
      case Entry.exerciseString:
        icon = SvgPicture.asset("images/exercise.svg");
        // icon = ImageIcon(AssetImage('images/exercise.svg'));
        break;
      case Entry.dietString:
        icon = SvgPicture.asset("images/diet.svg");
        // icon = ImageIcon(AssetImage('images/diet.svg'));
        break;
      case Entry.ibsIntensityString:
        icon = SvgPicture.asset("images/ibsIntensity.svg");
        // icon = ImageIcon(AssetImage('images/ibsIntensity.svg'));
        break;
      case Entry.hydrationString:
        icon = SvgPicture.asset("images/hydration.svg");
        // icon = ImageIcon(AssetImage('images/hydration.svg'));
        break;
    }
    return icon;
  }
}

class IBSData {
  IBSData(this.factor, this.severity);

  final double factor;
  final double severity;
}
