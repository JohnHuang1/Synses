import 'package:flutter/material.dart';
import 'slider_widget.dart';
import 'slider_dialog_widget.dart';

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
            InputDialogStateful(
                onInputCallback: (value) {
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
          ]),
    ));
  }
}
