import 'package:flutter/material.dart';

class Helpers {
  static const double padding = 20.0;

  static TextField textField({
    required TextEditingController controller,
    required String title,
    required TextInputType textInputType,
  }) {
    return TextField(
      autocorrect: true,
      controller: controller,
      keyboardType: textInputType,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
          hintText: title,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              Helpers.padding,
            ),
          )),
    );
    
  }
}
