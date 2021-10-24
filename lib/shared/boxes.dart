import 'package:hive/hive.dart';
import 'package:synses/data/entry.dart';

class Boxes {
  static const entryBoxString = 'entryBox';
  static Box<Entry> getEntries() => Hive.box<Entry>(entryBoxString);
}