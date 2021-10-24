import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:synses/data/entry.dart';
import 'package:synses/shared/boxes.dart';
import 'package:intl/intl.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<Box<Entry>>(
          valueListenable: Boxes.getEntries().listenable(),
          builder: (context, box, _) {
            final entries = box.values.toList().cast<Entry>();
            return entries.isNotEmpty ? buildContent(entries.reversed.toList()) : Container();
          }),
    );
  }

  Widget buildContent(List<Entry> entries) {
    print("entries length = ${entries.length}");
    return ListView.builder(
      itemCount: entries.length,
      itemBuilder: (BuildContext context, int index) {
        return _itemBuilder(entries[index]);
      },
    );
  }

  Widget _itemBuilder(Entry entry) {
    List<String> dates =
        DateFormat('yyyy/mm/dd kk:mm').format(entry.timestamp).split(' ');
    print("entry type ${entry.timeSlept}");

    Widget numDisplay = buildNumDisplay(entry);

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(children: [Text(dates[1]), Text(dates[0])]),
          Row(
            children: [
              entry.getIcon() ?? Container(),
              Text(entry.getEntryType())
            ],
          ),
          numDisplay
        ],
      ),
      margin: EdgeInsets.only(left: 5, right: 5, top: 5),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.lightBlueAccent,
      ),
    );
  }

  Widget buildNumDisplay(Entry entry) {
    List<dynamic> values = entry.getEntryValues();
    List<String> prompt = getDataPrompt(entry.getEntryType());
    return Column(
      children: prompt
          .map((e) => Row(
        mainAxisAlignment: MainAxisAlignment.start,
                children: [Text(e), Text((values[prompt.indexOf(e)] * 100).round().toString())],
              ))
          .toList(),
    );
  }

  List<String> getDataPrompt(String entryType) {
    List<String> val = List.empty(growable: true);
    switch (entryType) {
      case Entry.sleepString:
        val.add("Hours: ");
        break;
      case Entry.bathroomString:
        val.add("Discomfort: ");
        val.add("# of Trips: ");
        break;
      case Entry.moodString:
        val.add("Happiness: ");
        break;
      case Entry.exerciseString:
        val.add("Hours: ");
        val.add("Intensity: ");
        break;
      case Entry.dietString:
        val.add("Protein %: ");
        val.add("Vegetables %: ");
        val.add("Fruits %: ");
        val.add("Grains %: ");
        val.add("Dairy %: ");
        val.add("Junk Food %: ");
        break;
      case Entry.ibsIntensityString:
        val.add("Intensity: ");
        break;
      case Entry.hydrationString:
        val.add("Liters: ");
        break;
    }
    return val;
  }
}
