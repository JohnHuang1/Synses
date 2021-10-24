import 'package:flutter/material.dart';
import 'slider_widget.dart';

class InputPage extends StatelessWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SliderStateful(min: 1.0, max: 10.0, divisions: 10),
      ),
    );
  }
}
