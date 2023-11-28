
import 'package:flutter/material.dart';

class DropDownFormModel extends StatelessWidget {
  final List<DropdownMenuItem<String>> items;
  final Function(String?)? onChanged;
   final String formProperty;
   final Map<String, String> formValues;

  const DropDownFormModel({super.key, required this.items, this.onChanged, required this.formProperty, required this.formValues});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: items.first.value,
        items: items,
        onChanged: (value) {
          print(value);

        }
    );
  }
}