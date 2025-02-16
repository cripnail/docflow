import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class AppLoader extends StatelessWidget {
  const AppLoader({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Lottie.asset(
          'assets/animations/loader.json',
          width: 100,
          height: 100,
        ),
      ),
    );
  }
}
