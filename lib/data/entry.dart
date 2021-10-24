import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:synses/data/dietData.dart';
import 'package:synses/data/weightingData.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
  static const sleepString = 'Sleep';
  static const bathroomString = 'Bathroom';
  static const moodString = 'Mood';
  static const exerciseString = 'Exercise';
  static const weightingString = 'Weighting';
  static const dietString = 'Diet';
  static const hydrationString = 'IBS Intensity';
  static const ibsIntensityString = 'Hydration';


  String getEntryType(){
    String val = '';

    if(timeSlept != null){
      val = sleepString;
    } else if(bathroomDiscomfortLevel != null || numOfBathroomVisits != null){
      val = bathroomString;
    } else if(happinessLevel != null){
      val = moodString;
    } else if(exerciseDurationHours != null || exerciseIntensity != null){
      val = exerciseString;
    } else if(weightingData != null){
      val = weightingString;
    } else if(dietData != null){
      val = dietString;
    } else if(ibsIntensity != null){
      val = ibsIntensityString;
    } else if(waterAmt != null){
      val = hydrationString;
    }
    return val;
  }
  List<dynamic> getEntryValues(){
    List<dynamic> data = List.empty(growable: true);
    print("entry called");
    switch(getEntryType()){
      case sleepString:
        print("sleep called");
        data.add(timeSlept!);
        break;
      case bathroomString:
        data.add(bathroomDiscomfortLevel!);
        data.add(numOfBathroomVisits!);
        break;
      case moodString:
        data.add(happinessLevel!);
        break;
      case exerciseString:
        data.add(exerciseIntensity!);
        data.add(exerciseDurationHours!);
        break;
      case weightingString:
        data.add(weightingData!);
        break;
      case dietString:
        data.add(dietData!);
        break;
      case ibsIntensityString:
        data.add(ibsIntensity!);
        break;
      case hydrationString:
        data.add(waterAmt!);
        break;
    }
    return data;
  }


  Widget? getIcon(){
    Widget? icon;
    switch(getEntryType()){
      case sleepString:
        icon = SvgPicture.asset("images/sleep.svg");
        // icon = ImageIcon(AssetImage('images/sleep.svg'));
        break;
      case bathroomString:
        // icon = SvgPicture.asset("images/bathroom.svg");
        icon = ImageIcon(AssetImage('images/toilet.png'));
        break;
      case moodString:
        icon = SvgPicture.asset("images/mood.svg");
        // icon = ImageIcon(AssetImage('images/mood.svg'));
        break;
      case exerciseString:
        icon = SvgPicture.asset("images/exercise.svg");
        // icon = ImageIcon(AssetImage('images/exercise.svg'));
        break;
      case dietString:
        icon = SvgPicture.asset("images/diet.svg");
        // icon = ImageIcon(AssetImage('images/diet.svg'));
        break;
      case ibsIntensityString:
        icon = SvgPicture.asset("images/ibsIntensity.svg");
        // icon = ImageIcon(AssetImage('images/ibsIntensity.svg'));
        break;
      case hydrationString:
        icon = SvgPicture.asset("images/hydration.svg");
        // icon = ImageIcon(AssetImage('images/hydration.svg'));
        break;
    }
    return icon;
  }
}
