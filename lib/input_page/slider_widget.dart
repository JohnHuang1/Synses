import 'package:flutter/material.dart';

class SliderStateful extends StatefulWidget {
  double min = 0;
  double max = 0;
  int divisions = 0;
  SliderStateful(
      {Key? key, required this.min, required this.max, required this.divisions})
      : super(key: key);

  @override
  State<SliderStateful> createState() =>
      _SliderStatefulState(min, max, divisions);
}

/// This is the private State class that goes with SliderStateful.
class _SliderStatefulState extends State<SliderStateful> {
  _SliderStatefulState(this.min, this.max, this.divisions);
  double _currentSliderValue = 5;
  double min;
  double max;
  int divisions;
  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _currentSliderValue,
      min: min,
      max: max,
      divisions: divisions,
      label: _currentSliderValue.round().toString(),
      onChanged: (double value) {
        setState(() {
          _currentSliderValue = value;
        });
      },
    );
  }
}
