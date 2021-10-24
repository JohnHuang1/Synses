import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class DietInputWidget extends StatelessWidget {
  Function onInputCallback;
  String title;
  Widget icon;
  String label;

  DietInputWidget(
      {required this.onInputCallback,
      required this.title,
      required this.icon,
      this.label = ''});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: icon,
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return CustomDialog(
                title: title,
                icon: icon,
                onInputCallback: onInputCallback,
              );
            });
      },
    );
  }
}

class CustomDialog extends StatefulWidget {
  Function onInputCallback;
  String title;
  Widget icon;
  String label;

  CustomDialog(
      {Key? key,
      required this.onInputCallback,
      required this.title,
      required this.icon,
      this.label = ''})
      : super(key: key);

  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  List<double> vals = List.filled(6, 0);
  List<String> foodCat = [
    'Protein',
    'Vegetables',
    'Fruit',
    'Grains',
    'Dairy',
    'Junk Food'
  ];

  Map<String, double> foodVals = {
    'Protein': 0,
    'Vegetables': 0,
    'Fruit': 0,
    'Grains': 0,
    'Dairy': 0,
    'Junk Food': 0
  };
  List<bool> foodToggle = List.filled(6, false);

  int key = 0;

  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children:
              foodCat.map((e) => _itemBuilder(foodCat.indexOf(e), e)).toList()
                ..add(Container(
                    width: 300,
                    height: 200,
                    child: PieChart(
                      key: ValueKey(key),
                      dataMap: foodVals,
                      chartLegendSpacing: 20,
                      animationDuration: Duration(milliseconds: 0),
                    ))),
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context, 'OK');
            widget.onInputCallback(
                foodVals.entries.map((e) => e.value).toList(growable: false));
          },
          child: const Text('OK'),
        ),
      ],
      contentPadding: EdgeInsets.all(10),
      insetPadding: EdgeInsets.all(10),
    );
  }

  Widget _itemBuilder(int index, String label) {
    return Row(
      children: [
        Checkbox(
            value: foodToggle[index],
            onChanged: (toggle) {
              setState(() {
                foodToggle[index] = toggle!;
                foodVals.update(foodCat[index], (value) => 0);
                key += 1;
              });
            }),
        Text(label),
        Expanded(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                children: [
              foodToggle[index]
                  ? Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: SmallSlider(
                        valueChanged: (newValue) {
                          setState(() {
                            foodVals.update(
                                foodCat[index], (value) => newValue);
                            key += 1;
                            print("foodVals = $foodVals");
                          });
                        },
                      ),
                    )
                  : Container()
            ]))
      ],
    );
  }
}

class SmallSlider extends StatefulWidget {
  Function valueChanged;

  SmallSlider({Key? key, required this.valueChanged}) : super(key: key);

  @override
  _SmallSliderState createState() => _SmallSliderState();
}

class _SmallSliderState extends State<SmallSlider> {
  double val = 0;

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(trackShape: CustomTrackShape()),
      child: Container(
        width: 150,
        child: Slider(
          value: val,
          min: 0,
          max: 10,
          divisions: 10,
          label: val.round().toString(),
          onChanged: (double newValue) {
            setState(() {
              val = newValue;
              widget.valueChanged(newValue);
            });
          },
        ),
      ),
    );
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = sliderTheme.trackHeight!;
    final double trackLeft = offset.dx;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
