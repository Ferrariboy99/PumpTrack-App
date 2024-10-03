import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../constants/assets.dart';
import '../styles/styles.dart';

class EmptyAnimation extends StatelessWidget {
  final String message;

  const EmptyAnimation({super.key, required this.message});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LottieBuilder.asset(
          Assets.emptySectionAnimation,
          width: double.infinity,
          height: 300,
        ),
        Text(
          message,
          style: TextStyle(color: AppColors.blackText, fontSize: 17),
        ),
      ],
    );
  }
}
