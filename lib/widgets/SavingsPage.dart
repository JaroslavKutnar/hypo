import 'package:flutter/material.dart';

class SavingsPage extends StatefulWidget {
  @override
  _SavingsPageState createState() => _SavingsPageState();
}

class _SavingsPageState extends State<SavingsPage> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        keyboardType: TextInputType.number, // Use email input type for emails.
        decoration:
            new InputDecoration(hintText: 'How much', labelText: 'Hypo'));
  }
}
