import 'dart:html';

import 'package:flutter/material.dart';
import 'slider_widget.dart';

class textSliderStateful extends StatefulWidget {
  Function onInputCallback;
  String title;
  textSliderStateful(
      {Key? key, required this.onInputCallback, required this.title})
      : super(key: key);

  @override
  State<textSliderStateful> createState() =>
      _textSliderState(onInputCallback, title);
}

class _textSliderState extends State<textSliderStateful> {
  _textSliderState(this.onInputCallback, this.title);
  Function onInputCallback;
  String title;
  int rvalue = 0;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.ac_unit),
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text(title),
          content: SliderStateful(
            min: 0.0,
            max: 10.0,
            divisions: 10,
            currentSliderValue: 0,
            onChangedCallback: (value) {
              rvalue = value;
            },
          ),
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
