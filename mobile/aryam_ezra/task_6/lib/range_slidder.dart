import 'package:flutter/material.dart';

class MyRange extends StatefulWidget {
  @override
  _MyRangeState createState() => _MyRangeState();
}

class _MyRangeState extends State<MyRange> {
  RangeValues _currentRange = RangeValues(0, 1000);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Price: ${_currentRange.start.toStringAsFixed(0)} - ${_currentRange.end.toStringAsFixed(0)}',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
        RangeSlider(
          activeColor: Color.fromARGB(255, 54, 104, 255),
            values: _currentRange,
            min: 0,
            max: 1000,
            divisions: 10,
            labels: RangeLabels(
              _currentRange.start.round().toString(),
              _currentRange.end.round().toString(),
            ),
            onChanged: (RangeValues values) {
              setState(() {
                _currentRange = values;
              });
            },
          ),
      ],
    );
  }
}
