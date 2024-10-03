import 'package:flutter/material.dart';
import 'package:pumptrack/styles/colors.dart';

class TextStyles {
  static TextStyle normalBlackText = TextStyle(color: AppColors.blackText);
  static TextStyle normalWhiteText = TextStyle(color: AppColors.whiteText);
  static TextStyle normalBlackBoldText = TextStyle(
      color: AppColors.blackText, fontWeight: FontWeight.bold, fontSize: 17);
  static TextStyle headerBlack = TextStyle(
      fontSize: 30, color: AppColors.blackText, fontWeight: FontWeight.bold);
  static TextStyle headerBlackSub = TextStyle(
      fontSize: 20, color: AppColors.blackText, fontWeight: FontWeight.bold);
  static TextStyle headerWhite = TextStyle(
      fontSize: 50, fontWeight: FontWeight.bold, color: AppColors.white);
}
