import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hypo/widgets/NumericStep.dart';

class HypoPage extends StatefulWidget {
  @override
  _HypoPageState createState() => _HypoPageState();
}

class _HypoPageState extends State<HypoPage> {
  /// the amount of the mortgage
  int _amount = 2000000;

  /// interest rate
  double _interest = 1.89;

  /// number of years to repay
  int _years = 15;

  TextStyle _labelTextStyle = TextStyle(
      fontStyle: FontStyle.normal, fontSize: 16, color: Colors.black54);
  TextStyle _headerTextStyle = TextStyle(
      fontStyle: FontStyle.normal,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.black54);

  ///build
  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      //TODO: change the GridView, make own implementation to fit the box to the content
      padding: EdgeInsets.all(10.0),
      maxCrossAxisExtent: 500,
      crossAxisSpacing: 10.0,
      mainAxisSpacing: 10.0,
      childAspectRatio: 1.33,
      //shrinkWrap: true,
      children: getAllVariants(),
    );
  }

  /// get the all saved variants of mortgage
  List<Widget> getAllVariants() {
    List<Widget> result = List<Widget>();
    for (int i = 0; i < 5; i++) {
      result.add(Container(
        decoration: BoxDecoration(
            border: Border.all(color: Color(0x0F000000)),
            borderRadius: BorderRadius.all(Radius.circular(20)),
            gradient:
                new LinearGradient(colors: [Colors.white, Color(0xFFf5f4f4)])),
        padding: EdgeInsets.all(10.0),
        child: ListView(physics: NeverScrollableScrollPhysics(), children: [
          Text(
            "Varianta ${i + 1}",
            style: _headerTextStyle,
            textAlign: TextAlign.center,
          ),
          Text(
            "Výše úvěru",
            style: _labelTextStyle,
          ),
          NumericStep(
            initialValue: 2500000,
            minValue: 800000,
            maxValue: 5000000,
            step: 100000,
            decimals: 0,
            suffix: ",-",
            onChanged: (value) {
              _amount = value.round();
            },
          ),
          Text(
            "Úroková sazba",
            style: _labelTextStyle,
          ),
          NumericStep(
            initialValue: 1.9,
            minValue: 0.1,
            maxValue: 5.0,
            step: 0.1,
            decimals: 1,
            suffix: "%",
            onChanged: (value) {
              _interest = value;
            },
          ),
          Text(
            "Doba splácení",
            style: _labelTextStyle,
          ),
          NumericStep(
            initialValue: 25,
            minValue: 5,
            maxValue: 35,
            step: 1,
            decimals: 0,
            suffix: "let",
            onChanged: (value) {
              _years = value.round();
            },
          ),
        ]),
      ));
    }
    return result;
  }
}
