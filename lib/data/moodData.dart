import 'package:hive/hive.dart';

part 'moodData.g.dart';

@HiveType(typeId: 2)
class MoodData extends HiveObject{
  @HiveField(0)
  late double happinessLevel;
}