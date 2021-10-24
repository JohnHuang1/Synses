import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:synses/data/dietData.dart';
import 'package:synses/data/entry.dart';
import 'package:synses/input_page/diet_input_widget.dart';
import 'package:synses/input_page/slider_dialog_exercise.dart';
import 'package:synses/shared/boxes.dart';
import 'slider_dialog_widget.dart';
import 'text_slider_widget.dart';

class InputPage extends StatelessWidget {
  //List of values to store inputs
  InputPage({Key? key}) : super(key: key);

  final box = Boxes.getEntries();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: GridView.count(
            shrinkWrap: true,
              primary: false,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 3,
              children: [
                InputDialogStateful(
                    //Sleep
                    onInputCallback: (value) {
                      print("sleep $value");
                      box.add(
                          Entry(timestamp: DateTime.now(), timeSlept: value));
                    },
                    title: 'Sleep',
                    label: 'Hours Slept',
                    icon: SvgPicture.asset("images/sleep.svg")),
                TextSliderStateful(
                    //Bathroom
                    onInputCallback: (value) {
                      print("bathroom ${value[0]}  ${value[1]}");
                      box.add(Entry(
                          timestamp: DateTime.now(),
                          bathroomDiscomfortLevel: value[1],
                          numOfBathroomVisits: value[0]));
                    },
                    title: 'Bathroom',
                    label: 'Discomfort Level',
                    icon: ImageIcon(AssetImage('images/toilet.png'))),
                InputDialogStateful(
                    //Mood
                    onInputCallback: (value) {
                      print("mood $value");
                      box.add(Entry(
                          timestamp: DateTime.now(), happinessLevel: value));
                    },
                    title: 'Mood/Stress',
                    label: "How are you feeling?",
                    icon: SvgPicture.asset("images/mood.svg")),
                ExerciseSliderStateful(
                    //Exercise
                    onInputCallback: (value) {
                      print("exercise ${value[0]}  ${value[1]}");
                      box.add(Entry(
                          timestamp: DateTime.now(),
                          exerciseDurationHours: value[1],
                          exerciseIntensity: value[0]));
                    },
                    title: 'Exercise',
                    icon: SvgPicture.asset("images/exercise.svg")),
                DietInputWidget(
                    //Diet
                    onInputCallback: (List<double> value) {
                      double total = value.reduce((a, b) => a + b);
                      print(
                          "exercise ${value[0]}  ${value[1]} ${value[2]} ${value[3]} ${value[4]} ${value[5]}");
                      box.add(Entry(
                          timestamp: DateTime.now(),
                          dietData: DietData(
                              proteinVal: value[0] / total * 100,
                              vegetableVal: value[1] / total * 100,
                              fruitVal: value[2] / total * 100,
                              grainVal: value[3] / total * 100,
                              dairyVal: value[4] / total * 100,
                              junkFoodVal: value[5] / total * 100)));
                    },
                    title: 'Diet',
                    icon: SvgPicture.asset("images/diet.svg")),
                InputDialogStateful(
                    //Hydration
                    onInputCallback: (value) {
                      print("hydration $value");
                      box.add(
                          Entry(timestamp: DateTime.now(), waterAmt: value));
                    },
                    title: 'Hydration level',
                    label: 'Cups of Water',
                    icon: SvgPicture.asset("images/hydration.svg")),
                Container(), //For spacing purposes
                InputDialogStateful(
                    //IBS Severity
                    onInputCallback: (value) {
                      print("ibsIntensity $value");
                      box.add(Entry(
                          timestamp: DateTime.now(), ibsIntensity: value));
                    },
                    title: 'IBS Today?',
                    label: 'Intensity',
                    icon: SvgPicture.asset("images/ibsIntensity.svg")),
              ]),
        ),
      ),
    );
  }
}
