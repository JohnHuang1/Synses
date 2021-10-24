import 'package:hive/hive.dart';

part 'dietData.g.dart';

@HiveType(typeId: 4)
class DietData extends HiveObject {
  @HiveField(0)
  late double proteinVal;
  @HiveField(1)
  late double fruitVal;
  @HiveField(2)
  late double grainVal;
  @HiveField(3)
  late double dairyVal;
  @HiveField(4)
  late double junkFoodVal;
  @HiveField(5)
  late double vegetableVal;

  DietData(
      {required this.proteinVal,
      required this.fruitVal,
      required this.vegetableVal,
      required this.grainVal,
      required this.dairyVal,
      required this.junkFoodVal});
}
