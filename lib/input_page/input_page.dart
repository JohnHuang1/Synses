import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:synses/data/entry.dart';
import 'package:synses/input_page/slider_dialog_exercise.dart';
import 'package:synses/shared/boxes.dart';
import 'slider_dialog_widget.dart';
import 'text_slider_widget.dart';

class InputPage extends StatelessWidget {
  List<double> inputData = [
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0
  ]; //List of values to store inputs
  InputPage({Key? key}) : super(key: key);

  final box = Boxes.getEntries();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 3,
          children: [
            InputDialogStateful(
                //Sleep
                onInputCallback: (value) {
                  inputData[0] = value;
                  print("sleep $value");
                  box.add(Entry(timestamp: DateTime.now(), timeSlept: value));
                },
                title: 'Total Hours Slept',
                icon: SvgPicture.asset("images/sleep.svg")),
            textSliderStateful(
                //Bathroom
                onInputCallback: (value) {
                  inputData[1] = value;
                  inputData[2] = value;
                  print("bathroom ${value[1]}  ${value[2]}");
                  box.add(Entry(
                      timestamp: DateTime.now(),
                      bathroomDiscomfortLevel: value[1],
                      numOfBathroomVisits: value[2]));
                },
                title: 'Bathroom: Discomfort Level',
                icon: ImageIcon(AssetImage('images/toilet.png'))),
            InputDialogStateful(
                //Mood
                onInputCallback: (value) {
                  inputData[3] = value[1];
                  print("mood $value");
                  box.add(
                      Entry(timestamp: DateTime.now(), happinessLevel: value));
                },
                title: 'Mood/Stress Level',
                icon: SvgPicture.asset("images/mood.svg")),
            exerciseSliderStateful(
                //Exercise
                onInputCallback: (value) {
                  inputData[4] = value[0];
                  inputData[5] = value[1];
                },
                title: 'Exercise Intensity',
                icon: SvgPicture.asset("images/exercise.svg")),
            InputDialogStateful(
                //Diet
                onInputCallback: (value) {
                  inputData[6] = value;
                },
                title: 'Diet',
                icon: SvgPicture.asset("images/diet.svg")),
            InputDialogStateful(
                //Hydration
                onInputCallback: (value) {
                  inputData[7] = value;
                  print("hydration $value");
                  box.add(Entry(timestamp: DateTime.now(), waterAmt: value));
                },
                title: 'Hydration level',
                icon: SvgPicture.asset("images/hydration.svg")),
            InputDialogStateful(
                //IBS Severity
                onInputCallback: (value) {
                  inputData[8] = value;
                  print("ibsIntensity $value");
                  box.add(
                      Entry(timestamp: DateTime.now(), ibsIntensity: value));
                },
                title: 'IBS Severity',
                icon: SvgPicture.asset("images/ibsIntensity.svg")),
          ]),
    ));
  }
}
