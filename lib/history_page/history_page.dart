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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final entry = Entry(timestamp: DateTime.now(), timeSlept: 4);
          Boxes.getEntries().add(entry);
        },
      ),
      body: ValueListenableBuilder<Box<Entry>>(
          valueListenable: Boxes.getEntries().listenable(),
          builder: (context, box, _) {
            final entries = box.values.toList().cast<Entry>();
            return entries.isNotEmpty ? buildContent(entries) : Container();
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

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(children: [Text(dates[1]), Text(dates[0])]),
          Row(children: [entry.getIcon() ?? Container(),
            Text(entry.getEntryType())],),
          Text(entry.getEntryValues()[0].toString())
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
}
