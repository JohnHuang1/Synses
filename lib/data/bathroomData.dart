import 'package:hive/hive.dart';

part 'bathroomData.g.dart';

@HiveType(typeId: 1)
class BathroomData extends HiveObject{
  @HiveField(0)
  late double discomfortLevel;
  @HiveField(1)
  late int numOfTimes;
}