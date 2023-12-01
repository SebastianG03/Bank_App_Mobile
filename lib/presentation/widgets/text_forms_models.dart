import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TextFormsModels extends StatelessWidget {
  TextEditingController controller;
  TextInputType textInputType;
  FocusNode focusNode;
  FocusNode? nextFocusNode;
  String label;
  IconData icon;
  bool obscureText = false;
  Function()? tap;
  bool textForm;

  final String formProperty;
  final Map<String, String> formValues;

  TextFormsModels.textForm({super.key,required this.controller, required this.textInputType,
    required this.focusNode, this.nextFocusNode, required this.label, required this.icon, this.textForm = true,
    required this.formProperty, required this.formValues});


  TextFormsModels.passwordForm({super.key, required this.controller, required this.textInputType, required this.focusNode,
    this.nextFocusNode, required this.label, required this.icon, required this.obscureText, required this.tap,
    this.textForm = false, required this.formProperty, required this.formValues});

  @override
  Widget build(BuildContext context) {
    return textForm ? _textFormFieldModel(context,  controller, textInputType, focusNode, nextFocusNode, label, icon, formProperty, formValues) :
    _passwordFormFieldModel(context, controller, textInputType, focusNode, nextFocusNode,label, icon, obscureText, tap, formProperty, formValues);
  }

  static Widget _textFormFieldModel(BuildContext context, TextEditingController controller, TextInputType textInputType,
      FocusNode focusNode, FocusNode? nextFocusNode,String label, IconData icon, String formProperty, Map<String, String> formValues) {
    //, String Function(String?) validation,
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
      child: TextFormField(
        autofocus: true,
        controller: controller,
        keyboardType: textInputType,
        focusNode: focusNode,
        onChanged: (value) {
          formValues[formProperty] = value;
          print(value);
        },
        onFieldSubmitted: (_) {
          if(nextFocusNode != null) {
            FocusScope.of(context).requestFocus(nextFocusNode);
          } else {
            return;
          }
        },
        //validator: (value) => validation(value),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          labelText: label,
          icon: Icon(icon),
        ),
        style: const TextStyle(
          fontFamily: 'WorkSansSemiBold',
          fontSize: 16.0,
          color: Colors.black,
        ),
      ),
    );
  }

  static Widget _passwordFormFieldModel(BuildContext context, TextEditingController controller, TextInputType textInputType,
      FocusNode focusNode, FocusNode? nextFocusNode, String label, IconData icon, bool obscureText, Function()? tap, String formProperty, Map<String, String> formValues) {
    //, String Function(String?) validation,
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
      child: TextFormField(
        autofocus: true,
        controller: controller,
        keyboardType: textInputType,
        focusNode: focusNode,
        obscureText: obscureText,
        onChanged: (value) {
          formValues[formProperty] = value;
          print(value);
        },
        onFieldSubmitted: (_) {
          if(nextFocusNode != null) {
            FocusScope.of(context).requestFocus(nextFocusNode);
          } else {
            return;
          }
        },
        //validator: (value) => validation(value),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          labelText: label,
          icon: Icon(icon),
          suffix: GestureDetector(
            onTap: tap,
            child: Icon(
              obscureText ? FontAwesomeIcons.eye : FontAwesomeIcons.eyeSlash,
              size: 15.0,
              color: Colors.black,
            ),
          ),
        ),
        style: const TextStyle(
          fontFamily: 'WorkSansSemiBold',
          fontSize: 16.0,
          color: Colors.black,
        ),
      ),
    );
  }
}
