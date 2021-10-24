import 'package:flutter/material.dart';
import 'slider_widget.dart';

class InputPage extends StatelessWidget {
  List<double> inputData = [0, 1, 2, 3, 4, 5]; //List of values to store inputs
  InputPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Column(children: [
        SliderStateful(
          min: 0.0,
          max: 10.0,
          divisions: 10,
          currentSliderValue: 1.0,
          onChangedCallback: (value) {
            inputData[0] = value;
          },
        ),
        SliderStateful(
          min: 0.0,
          max: 10.0,
          divisions: 10,
          currentSliderValue: 1.0,
          onChangedCallback: (value) {
            inputData[1] = value;
          },
        ),
        SliderStateful(
          min: 0.0,
          max: 10.0,
          divisions: 10,
          currentSliderValue: 1.0,
          onChangedCallback: (value) {
            inputData[2] = value;
          },
        ),
        SliderStateful(
          min: 0.0,
          max: 10.0,
          divisions: 10,
          currentSliderValue: 1.0,
          onChangedCallback: (value) {
            inputData[3] = value;
          },
        ),
      ]),
    ));
  }
}
