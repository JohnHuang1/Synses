import 'package:hive/hive.dart';
import 'package:synses/data/bathroomData.dart';
import 'package:synses/data/dietData.dart';
import 'package:synses/data/exerciseData.dart';
import 'package:synses/data/hydrationData.dart';
import 'package:synses/data/moodData.dart';
import 'package:synses/data/sleepData.dart';
import 'package:synses/data/weightingData.dart';

import 'IBSData.dart';

part 'entry.g.dart';

@HiveType(typeId: 6)
class Entry extends HiveObject{
  @HiveField(0)
  late DateTime timestamp;
  @HiveField(1)
  SleepData? sleepData;
  @HiveField(2)
  BathroomData? bathroomData;
  @HiveField(3)
  MoodData? moodData;
  @HiveField(4)
  ExerciseData? exerciseData;
  @HiveField(5)
  WeightingData? weightingData;
  @HiveField(6)
  DietData? dietData;
  @HiveField(7)
  HydrationData? hydrationData;
  @HiveField(8)
  IBSData? ibsData;

}