import 'package:account_app/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

// import 'package:loo;
class LoadingPage extends StatelessWidget {
  const LoadingPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 100,
          width: context.width / 2,
          child: Lottie.asset(
            Helpers.LottieFile,
            animate: true,
            fit: BoxFit.fitWidth,
            reverse: true,
          ),
        ),
      ),
    );
  }
}
