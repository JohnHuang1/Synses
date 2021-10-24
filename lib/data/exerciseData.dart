import 'package:hive/hive.dart';

part 'exerciseData.g.dart';

@HiveType(typeId: 3)
class ExerciseData extends HiveObject{
  @HiveField(0)
  late double hoursExercised;
  @HiveField(1)
  late double intensity;
}