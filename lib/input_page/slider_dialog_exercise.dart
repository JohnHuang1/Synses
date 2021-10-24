import 'package:flutter/material.dart';
import 'slider_widget.dart';

class exerciseSliderStateful extends StatefulWidget {
  Function onInputCallback;
  String title;
  Widget icon;
  exerciseSliderStateful(
      {Key? key,
      required this.onInputCallback,
      required this.title,
      required this.icon})
      : super(key: key);

  @override
  State<exerciseSliderStateful> createState() =>
      _exerciseSliderState(onInputCallback, title, icon);
}

class _exerciseSliderState extends State<exerciseSliderStateful> {
  _exerciseSliderState(this.onInputCallback, this.title, this.icon);
  Function onInputCallback;
  String title;
  Widget icon;
  List<double> rvalue = [0, 0];
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: icon,
      onTap: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text(title),
          content: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              //posisi
              mainAxisSize: MainAxisSize.min,
              // untuk mengatur agar widget column mengikuti widget
              children: <Widget>[
                Text("Exercise Length:"),
                SliderStateful(
                  min: 0.0,
                  max: 10.0,
                  divisions: 10,
                  currentSliderValue: 0,
                  onChangedCallback: (value) {
                    rvalue[0] = value;
                  },
                ),
                Text("Exercise Intensity:"),
                SliderStateful(
                  min: 0.0,
                  max: 10.0,
                  divisions: 10,
                  currentSliderValue: 0,
                  onChangedCallback: (value) {
                    rvalue[1] = value;
                  },
                ),
              ]),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, 'OK');
                onInputCallback(rvalue);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      ),
    );
  }
}
