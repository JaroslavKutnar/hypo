import 'package:flutter/material.dart';

final Color _borderColor = Color(0x0F000000);

final BoxDecoration boxDecoration = BoxDecoration(
    border: Border.all(color: _borderColor),
    borderRadius: BorderRadius.all(Radius.circular(20)),
    gradient: new LinearGradient(colors: [Colors.white, Color(0xFFf5f4f4)]));

final TextStyle deleteButtonTextStyle = TextStyle(
    fontStyle: FontStyle.normal, fontSize: 16, color: Colors.redAccent);
