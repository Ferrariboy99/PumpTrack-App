import 'package:flutter/material.dart';
import 'package:pumptrack/styles/colors.dart';

// ================ custom app bar =================== //
class CustomAppBar extends StatelessWidget {
  final String title;
  final Color appBarColor;
  final Color titleColor;
  final bool centerTile;
  const CustomAppBar(
      {super.key,
      required this.title,
      required this.centerTile,
      required this.titleColor,
      required this.appBarColor});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: appBarColor,
        backgroundColor: appBarColor,
        shadowColor: AppColors.grey,
        elevation: 0.2,
        title: Text(
          title,
          style: TextStyle(color: titleColor, fontSize: 25),
        ),
        centerTitle: centerTile);
  }
}
