import 'package:flutter/material.dart';


class InputDecorations {

  static InputDecoration authInputDecoration({
    required String hintText,
    required String labelText,
    IconData? prefixIcon
  }) {
    return InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
            width: 2
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
            width: 2
          )
        ),
        hintText: hintText,
        labelText: labelText,
        labelStyle: TextStyle(
          color: Colors.black
        ),
        prefixIcon: prefixIcon != null 
          ? Icon( prefixIcon, color: Colors.deepPurple )
          : null
      );
  }  

}