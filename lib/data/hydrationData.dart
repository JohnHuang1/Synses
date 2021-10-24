import 'package:hive/hive.dart';

part 'hydrationData.g.dart';

@HiveType(typeId: 7)
class HydrationData extends HiveObject{
  @HiveField(0)
  late double waterAmt;
}