import 'package:hive/hive.dart';

part 'weightingData.g.dart';

@HiveType(typeId: 5)
class WeightingData extends HiveObject {
  @HiveField(0)
  late double sleepRank;
  @HiveField(1)
  late double bathroomRank;
  @HiveField(2)
  late double moodRank;
  @HiveField(3)
  late double exerciseRank;
  @HiveField(4)
  late double dietRank;
  @HiveField(5)
  late double hydrationRank;

  WeightingData(
      {required this.sleepRank,
      required this.bathroomRank,
      required this.moodRank,
      required this.exerciseRank,
      required this.dietRank,
      required this.hydrationRank});
}
