import 'package:flutter/material.dart';
import 'package:pumptrack/styles/colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Divider(color: AppColors.dividers));
  }
}
