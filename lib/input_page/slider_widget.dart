import 'package:flutter/material.dart';

class SliderStateful extends StatefulWidget {
  //Slider widget, can change values, returns final Slider Value
  double min = 0;
  double max = 0;
  double currentSliderValue = 6;
  int divisions = 0;
  Function onChangedCallback;
  SliderStateful(
      {Key? key,
      required this.min,
      required this.max,
      required this.divisions,
      required this.currentSliderValue,
      required this.onChangedCallback})
      : super(key: key);

  @override
  State<SliderStateful> createState() => _SliderStatefulState(
      min, max, divisions, currentSliderValue, onChangedCallback);
}

class _SliderStatefulState extends State<SliderStateful> {
  _SliderStatefulState(this.min, this.max, this.divisions,
      this.currentSliderValue, this.onChangedCallback);
  double currentSliderValue;
  double min;
  double max;
  int divisions;
  Function onChangedCallback;
  @override
  Widget build(BuildContext context) {
    return Slider(
      value: currentSliderValue,
      min: min,
      max: max,
      divisions: divisions,
      label: currentSliderValue.round().toString(),
      onChanged: (double value) {
        setState(() {
          currentSliderValue = value;
          onChangedCallback(value);
        });
      },
    );
  }
}
