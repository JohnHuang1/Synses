import 'package:hive/hive.dart';

part 'IBSData.g.dart';

@HiveType(typeId: 8)
class IBSData extends HiveObject{
  @HiveField(0)
  late double severity;
}