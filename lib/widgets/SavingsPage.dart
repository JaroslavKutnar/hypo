import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hypo/consts.dart';

import 'NumericStep.dart';

class SavingsPage extends StatefulWidget {
  @override
  _SavingsPageState createState() => _SavingsPageState();
}

class _SavingsPageState extends State<SavingsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
      alignment: Alignment.topCenter,
      child: (MediaQuery.of(context).orientation == Orientation.landscape)
          ? Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Expanded(
                child: Container(
                    padding: EdgeInsets.all(5.0), child: getPension(context)),
              ),
              Expanded(
                // TODO: set the same height as the first item - problem with intrinsicHeight
                child: Container(
                    padding: EdgeInsets.all(5.0), child: getSavings(context)),
              )
            ])
          : Column(children: [
              Container(
                  padding: EdgeInsets.all(5.0), child: getPension(context)),
              Container(
                  padding: EdgeInsets.all(5.0), child: getSavings(context))
            ]),
    );
  }

  Container getPension(BuildContext context) {
    return Container(
        decoration: boxDecoration,
        padding: EdgeInsets.all(5.0),
        child: ListView(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              Text(
                "Penzijní",
                style: Theme.of(context).textTheme.headline1,
                textAlign: TextAlign.center,
              ),
              Text(
                "Výše",
                style: Theme.of(context).textTheme.bodyText1,
                textAlign: TextAlign.left,
              ),
              NumericStep(
                initialValue: 2500,
                minValue: 0,
                maxValue: 3000,
                step: 500,
                decimals: 0,
                suffix: (double) => ",-",
                onChanged: (value) {
//                    _amount = value.round();
                },
              ),
              Text(
                "Příspěvek firmy",
                style: Theme.of(context).textTheme.bodyText1,
                textAlign: TextAlign.left,
              ),
              NumericStep(
                initialValue: 2500,
                minValue: 0,
                maxValue: 3000,
                step: 500,
                decimals: 0,
                suffix: (double) => ",-",
                onChanged: (value) {
//                    _amount = value.round();
                },
              ),
              Text(
                "Mimořádná splátka jednou za:",
                style: Theme.of(context).textTheme.bodyText1,
                textAlign: TextAlign.left,
              ),
              NumericStep(
                initialValue: 5,
                minValue: 1,
                maxValue: 30,
                step: 1,
                decimals: 0,
                suffix: (double d) {
                  if (d < 1.1) return "rok";
                  if (d < 4.1) return "roky";
                  return "let";
                },
                onChanged: (value) {
//                    _amount = value.round();
                },
              ),
            ]));
  }

  Container getSavings(BuildContext context) {
    return Container(
        decoration: boxDecoration,
        padding: EdgeInsets.all(5.0),
        child: ListView(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              Text(
                "Spoření",
                style: Theme.of(context).textTheme.headline1,
                textAlign: TextAlign.center,
              ),
              Text(
                "Měsíčně uspořeno",
                style: Theme.of(context).textTheme.bodyText1,
                textAlign: TextAlign.left,
              ),
              NumericStep(
                initialValue: 5000,
                minValue: 0,
                maxValue: 50000,
                step: 1000,
                decimals: 0,
                suffix: (double) => ",-",
                onChanged: (value) {
//                    _amount = value.round();
                },
              ),
              Text(
                "Mimořádná splátka jednou za:",
                style: Theme.of(context).textTheme.bodyText1,
                textAlign: TextAlign.left,
              ),
              NumericStep(
                initialValue: 5,
                minValue: 1,
                maxValue: 30,
                step: 1,
                decimals: 0,
                suffix: (double d) {
                  if (d < 1.1) return "rok";
                  if (d < 4.1) return "roky";
                  return "let";
                },
                onChanged: (value) {
//                    _amount = value.round();
                },
              ),
            ]));
  }
}
