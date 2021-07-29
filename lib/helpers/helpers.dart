import 'package:flutter/material.dart';

class Helpers {
  static const double padding = 20.0;

  static  String LottieFile = 'assets/images/loading-animation.json';

  static const String ManSvg = 'assets/images/man.svg';

  static const String PersonSvg = 'assets/images/person.svg';

  static const String Person1Svg = 'assets/images/person1.svg';

  static const String Person2Svg = 'assets/images/person2.svg';

  void timeago() {
// vx.VxTimeline()
  }

  static TextFormField textField({
    required TextEditingController controller,
    required String title,
    required TextInputType textInputType,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      // autovalidate: true,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
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

class LoginFormWidget extends StatelessWidget {
  final TextEditingController controller;
  final bool isPassword;
  final String hinText;
  final String labelText;
  final String? Function(String?)? validator;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  const LoginFormWidget({
    Key? key,
    required this.controller,
    required this.isPassword,
    required this.labelText,
    required this.textInputType,
    required this.textInputAction,
    required this.hinText,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      obscureText: isPassword,
      controller: controller,
      keyboardType: textInputType,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        hintText: hinText,
        enabled: true,
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    );
  }
}
