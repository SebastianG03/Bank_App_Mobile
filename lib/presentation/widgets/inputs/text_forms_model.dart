import 'package:flutter/material.dart';

class TextFormsModel extends StatelessWidget {
  final TextInputType textInputType;
  final InputDecoration decoration;
  void Function(String)? onChanged;
  String? Function(String?)? validator;

///*
/// Model for a text form, can be used in a stateless widget or in a stateful widget.
/// The parameter <b>onChanged</b> is the function; if the function you are going to send doesn't have parameters, send it by references.
/// The same goes for the parameter <b>validator</b>.
/// *
  TextFormsModel({super.key, required this.textInputType, required this.decoration, required this.onChanged, this.validator});


  @override
  Widget build(BuildContext context) {
    return _textFormFieldModel(context);
  }

  Widget _textFormFieldModel(BuildContext context) {
    //, String Function(String?) validation,
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
      child: TextFormField(
        keyboardType: textInputType,
        onChanged: onChanged,
        validator: validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: decoration,
        style: _textStyle(),
      ),
    );
  }

  TextStyle _textStyle() {
    return const TextStyle(
      fontFamily: 'WorkSansSemiBold',
      fontSize: 16.0,
      color: Colors.black,
    );
  }
}
