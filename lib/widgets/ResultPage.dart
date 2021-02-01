import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        //color: Colors.yellow,
        alignment: Alignment.center,
        child: Image.asset("assets/images/piggy.jpg"));
  }
}
