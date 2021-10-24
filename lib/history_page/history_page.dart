import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:synses/data/entry.dart';
import 'package:synses/shared/boxes.dart';

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
    return ListView.builder(
      itemCount: entries.length,
      itemBuilder: (BuildContext context, int index) {
        return _itemBuilder(entries[index]);
      },
    );
  }

  Widget _itemBuilder(Entry entry) {
    return Row(
      children: [
        Text(entry.timestamp.toString()),
        Text(entry.getEntryType()),
      ],
    );
  }
}
