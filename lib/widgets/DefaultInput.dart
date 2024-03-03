import 'package:flutter/material.dart';

class DefaultInput extends StatelessWidget {
  TextEditingController controller;
  String label;

  DefaultInput({super.key, required this.controller, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            label: Text(label),
          )),
    );
  }
}
