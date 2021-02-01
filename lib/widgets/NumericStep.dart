import 'package:flutter/material.dart';

class NumericStep extends StatefulWidget {
  final double initialValue;
  final double minValue;
  final double maxValue;
  final double step;
  final int decimals;
  final String suffix;

  final ValueChanged<double> onChanged;

  NumericStep({
    Key key,
    this.initialValue = 1.0,
    this.minValue = 0.0,
    this.maxValue = 10.0,
    this.onChanged,
    this.step = 1.0,
    this.decimals = 2,
    this.suffix = "",
  }) : super(key: key);

  @override
  _NumericStepState createState() => _NumericStepState();
}

class _NumericStepState extends State<NumericStep> {
  double value;

  @override
  void initState() {
    value = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(
              Icons.remove,
              color: Theme.of(context).accentColor,
            ),
            padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 18.0),
            iconSize: 32.0,
            color: Theme.of(context).primaryColor,
            onPressed: () {
              setState(() {
                if ((value - widget.step / 2) > widget.minValue) {
                  value -= widget.step;
                  widget.onChanged(value);
                }
              });
            },
          ),
          Text(
            '${value.toStringAsFixed(widget.decimals)} ' + widget.suffix,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.add,
              color: Theme.of(context).accentColor,
            ),
            padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 18.0),
            iconSize: 32.0,
            color: Theme.of(context).primaryColor,
            onPressed: () {
              setState(() {
                if ((value + widget.step / 2) < widget.maxValue) {
                  value += widget.step;
                  widget.onChanged(value);
                }
              });
            },
          ),
        ],
      ),
    );
  }
}
