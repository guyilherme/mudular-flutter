import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CampoPadrao extends StatelessWidget {
  const CampoPadrao({Key key, this.hintText, this.label, this.onChanged})
      : super(key: key);

  final Function(String) onChanged;
  final String label;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => TextField(
        onChanged: onChanged,
        decoration: InputDecoration(labelText: label, hintText: hintText),
      ),
    );
  }
}
