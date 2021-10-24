import 'package:flutter/material.dart';
import 'slider_widget.dart';
import 'slider_dialog_widget.dart';
import 'text_slider_widget.dart';

class InputPage extends StatelessWidget {
  List<double> inputData = [0, 0, 0, 0, 0, 0]; //List of values to store inputs
  InputPage({Key? key}) : super(key: key);

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
<<<<<<< Updated upstream
            InputDialogStateful(
                //Sleep
                onInputCallback: (value) {
                  inputData[0] = value;
                },
                title: 'Total Hours Slept',
                icon: Icon(Icons.airline_seat_individual_suite)),
            InputDialogStateful(
                //Bathroom
                onInputCallback: (value) {
                  inputData[0] = value;
                },
                title: 'Bathroom: Discomfort Level',
                icon: Icon(Icons.airline_seat_legroom_reduced_sharp)),
            InputDialogStateful(
                //Mood
                onInputCallback: (value) {
                  inputData[0] = value;
                },
                title: 'Mood/Stress Level',
                icon: Icon(Icons.add_reaction)),
            InputDialogStateful(
                //Exercise
                onInputCallback: (value) {
                  inputData[0] = value;
                },
                title: 'Exercise Intensity',
                icon: Icon(Icons.add_reaction)),
            InputDialogStateful(
                //Diet
                onInputCallback: (value) {
                  inputData[0] = value;
                },
                title: 'Diet',
                icon: Icon(Icons.food_bank)),
            InputDialogStateful(
                //Hydration
                onInputCallback: (value) {
                  inputData[0] = value;
                },
                title: 'Hydration level',
                icon: Icon(Icons.add_reaction)),
=======
            SliderDialog(
                inputCallback: (value) {
                  inputData[0] = value;
                },
                title: 'Total Hours Slept'),
            Text('# of Bathroom Trips'),
            Text('Discomfort of Bathroom Trips'),
            SliderStateful(
              min: 0.0,
              max: 10.0,
              divisions: 10,
              currentSliderValue: 0,
              onChangedCallback: (value) {
                inputData[1] = value;
              },
            ),
            Text('Stress Level'),
            SliderStateful(
              min: 0.0,
              max: 10.0,
              divisions: 10,
              currentSliderValue: 0,
              onChangedCallback: (value) {
                inputData[2] = value;
              },
            ),
            Text('Exercise'),
            SliderStateful(
              min: 0.0,
              max: 10.0,
              divisions: 10,
              currentSliderValue: 0,
              onChangedCallback: (value) {
                inputData[3] = value;
              },
            ),
            textSliderStateful(
                onInputCallback: (value) {
                  inputData[4] = value[0]; //trips to the bathroom
                  inputData[5] = value[1]; //level of discomfort
                  print(inputData[4]);
                  print(inputData[5]);
                },
                title: 'Restroom Usage')
>>>>>>> Stashed changes
          ]),
    ));
  }
}
