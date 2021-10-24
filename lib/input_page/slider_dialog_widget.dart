import 'package:flutter/material.dart';
import 'slider_widget.dart';

class SliderDialog extends StatelessWidget {
  Function inputCallback;
  String title;
  SliderDialog({Key? key, required this.inputCallback, required this.title})
      : super(key: key);
  int rvalue = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Center(
                child: TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('AlertDialog Title'),
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
                inputCallback(rvalue);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      ),
      child: const Text('Show Dialog'),
    ))));
  }
}
