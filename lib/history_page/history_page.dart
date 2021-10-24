import 'package:flutter/material.dart';
import 'package:synses/data/entry.dart';
import 'package:synses/shared/boxes.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final entry = Entry(timestamp: DateTime.now());
          Boxes.getEntries().add(entry);
        },
      ),
    );
  }
}
