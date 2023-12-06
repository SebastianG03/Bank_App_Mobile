import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PasswordFormsModel extends StatelessWidget {
  final TextInputType textInputType;
  void Function(String)? onChanged;
  String? errorMessage;
  final String? label;
  final bool obscureText;
  final Function()? tap;


  PasswordFormsModel({super.key, required this.textInputType, required this.label, required this.onChanged,
    required this.errorMessage, this.obscureText = true, required this.tap });

  @override
  Widget build(BuildContext context) {
    return _passwordFormFieldModel(context);
  }


  Widget _passwordFormFieldModel(BuildContext context) {
    //, String Function(String?) validation,
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
      child: TextFormField(
        keyboardType: textInputType,
        obscureText: obscureText,
        onChanged: onChanged,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          labelText: label,
          errorText: errorMessage,
          icon: const Icon(FontAwesomeIcons.lock),
          suffix: GestureDetector(
            onTap: tap,
            child: Icon(
              obscureText ? FontAwesomeIcons.eye : FontAwesomeIcons.eyeSlash,
              size: 15.0,
              color: Colors.black,
            ),
          ),
        ),
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
