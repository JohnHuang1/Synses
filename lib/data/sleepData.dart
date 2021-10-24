import 'package:hive/hive.dart';

part 'sleepData.g.dart';

@HiveType(typeId: 0)
class SleepData extends HiveObject{
  @HiveField(0)
  late double hoursSlept;
}