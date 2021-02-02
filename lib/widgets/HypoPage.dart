import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hypo/widgets/NumericStep.dart';

import '../consts.dart';

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

  ///build
  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      //TODO: change the GridView, make own implementation to fit the box to the content
      padding: EdgeInsets.all(10.0),
      maxCrossAxisExtent: 500,
      crossAxisSpacing: 10.0,
      mainAxisSpacing: 10.0,
      childAspectRatio: 1.1,
      //shrinkWrap: true,
      children: getAllVariants(),
    );
  }

  /// get the all saved variants of mortgage
  List<Widget> getAllVariants() {
    List<Widget> result = List<Widget>();
    for (int i = 0; i < 5; i++) {
      result.add(Container(
        decoration: boxDecoration,
        padding: EdgeInsets.all(10.0),
        child: ListView(physics: NeverScrollableScrollPhysics(), children: [
          Text(
            "Varianta ${i + 1}",
            style: Theme.of(context).textTheme.headline1,
            textAlign: TextAlign.center,
          ),
          Text(
            "Výše úvěru",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          NumericStep(
            initialValue: 2500000,
            minValue: 800000,
            maxValue: 5000000,
            step: 100000,
            decimals: 0,
            suffix: (double) => ",-",
            onChanged: (value) {
              _amount = value.round();
            },
          ),
          Text(
            "Úroková sazba",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          NumericStep(
            initialValue: 1.9,
            minValue: 0.1,
            maxValue: 5.0,
            step: 0.1,
            decimals: 1,
            suffix: (double) => "%",
            onChanged: (value) {
              _interest = value;
            },
          ),
          Text(
            "Doba splácení",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          NumericStep(
            initialValue: 25,
            minValue: 5,
            maxValue: 35,
            step: 1,
            decimals: 0,
            suffix: (double d) => "let";
            },
            onChanged: (value) {
              _years = value.round();
            },
          ),
          /*Text(
            "Zobrazovat variantu",
            style: _labelTextStyle,
          ),
          Row(
            children: [
              Expanded(child: Container()),
              Switch(
                value: true,
              )
            ],
          ),*/
          Container(
            height: 20,
          ),
          FlatButton(
              onPressed: i == 0 ? null : () {},
              child: Text(
                "Odstranit variantu",
                style: i == 0
                    ? Theme.of(context).textTheme.bodyText1
                    : deleteButtonTextStyle,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.grey))),
        ]),
      ));
    }

    result.add(
      FlatButton(
          child: Text(
            "+",
            //style: _deleteButtonTextStyle,
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(color: Colors.grey))),
    );
    return result;
  }
}
