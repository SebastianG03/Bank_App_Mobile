import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FormsModels {

  static Widget textFormFieldModel(BuildContext context, dynamic saveValue,TextEditingController controller, TextInputType textInputType,
      FocusNode focusNode, String label, IconData icon) {
    //, String Function(String?) validation,
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
      child: TextFormField(
        autofocus: true,
        textCapitalization: TextCapitalization.words,
        onChanged: (value) => saveValue = value,
        controller: controller,
        keyboardType: textInputType,
        focusNode: focusNode,
        //validator: (value) => validation(value),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          labelText: label,
          icon: Icon(icon),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              )
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

  static Widget passwordFormFieldModel(BuildContext context, dynamic saveValue,TextEditingController controller, TextInputType textInputType,
      FocusNode focusNode, String label, IconData icon, bool obscureText, Function()? tap) {
    //, String Function(String?) validation,
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
      child: TextFormField(
        autofocus: true,
        textCapitalization: TextCapitalization.words,
        onChanged: (value) => saveValue = value,
        controller: controller,
        keyboardType: textInputType,
        focusNode: focusNode,
        obscureText: obscureText,
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
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              )
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