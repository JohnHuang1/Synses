import 'package:flutter/material.dart';
import 'slider_widget.dart';

class InputDialogStateful extends StatefulWidget {
  Function onInputCallback;
  String title;
  Icon icon;
  InputDialogStateful(
      {Key? key,
      required this.onInputCallback,
      required this.title,
      required this.icon})
      : super(key: key);

  @override
  State<InputDialogStateful> createState() =>
      _InputDialogState(onInputCallback, title, icon);
}

class _InputDialogState extends State<InputDialogStateful> {
  _InputDialogState(this.onInputCallback, this.title, this.icon);
  Function onInputCallback;
  String title;
  Icon icon;
  double rvalue = 0;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: icon,
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
