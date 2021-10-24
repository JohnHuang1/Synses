import 'package:hive/hive.dart';
import 'package:synses/data/dietData.dart';
import 'package:synses/data/weightingData.dart';

part 'entry.g.dart';

@HiveType(typeId: 6)
class Entry extends HiveObject {
  @HiveField(0)
  late DateTime timestamp;
  @HiveField(1)
  double? timeSlept;
  @HiveField(2)
  double? bathroomDiscomfortLevel;
  @HiveField(3)
  double? happinessLevel;
  @HiveField(4)
  double? exerciseDurationHours;
  @HiveField(5)
  WeightingData? weightingData;
  @HiveField(6)
  DietData? dietData;
  @HiveField(7)
  double? waterAmt;
  @HiveField(8)
  double? ibsIntensity;
  @HiveField(9)
  double? exerciseIntensity;
  @HiveField(10)
  double? numOfBathroomVisits;

  Entry(
      {required this.timestamp,
      this.timeSlept,
      this.bathroomDiscomfortLevel,
      this.happinessLevel,
      this.exerciseDurationHours,
      this.weightingData,
      this.dietData,
      this.waterAmt,
      this.ibsIntensity,
      this.exerciseIntensity,
      this.numOfBathroomVisits});

  String getEntryType(){
    String val = '';

    val += (timeSlept == null ? '' : 'Sleep');
    val += (bathroomDiscomfortLevel == null || numOfBathroomVisits == null ? '' : 'Bathroom');
    val += (happinessLevel == null ? '' : 'Mood');
    val += (exerciseDurationHours == null || exerciseIntensity == null ? '' : 'Exercise');
    val += (weightingData == null ? '' : 'Weighting');
    val += (dietData == null ? '' : 'Diet');
    val += (ibsIntensity == null ? '' : 'IBS Intensity');
    val += (waterAmt == null ? '' : 'Hydration');

    return val;
  }
}
