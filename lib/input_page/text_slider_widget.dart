import 'dart:html';

import 'package:flutter/material.dart';
import 'slider_widget.dart';

class textSliderStateful extends StatefulWidget {
  Function onInputCallback;
  String title;
  Icon icon;
  textSliderStateful(
      {Key? key,
      required this.onInputCallback,
      required this.title,
      required this.icon})
      : super(key: key);

  @override
  State<textSliderStateful> createState() =>
      _textSliderState(onInputCallback, title, icon);
}

class _textSliderState extends State<textSliderStateful> {
  _textSliderState(this.onInputCallback, this.title, this.icon);
  Function onInputCallback;
  String title;
  Icon icon;
  List<double> rvalue = [0, 0];
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: icon,
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text(title),
          content: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              //posisi
              mainAxisSize: MainAxisSize.min,
              // untuk mengatur agar widget column mengikuti widget
              children: <Widget>[
                SliderStateful(
                  min: 0.0,
                  max: 10.0,
                  divisions: 10,
                  currentSliderValue: 0,
                  onChangedCallback: (value) {
                    rvalue[1] = value;
                  },
                ),
                TextField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter total trips to the restroom'),
                  onChanged: (value) {
                    var long2 = double.parse(value);
                    rvalue[0] = long2;
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
