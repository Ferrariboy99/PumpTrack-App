import 'package:flutter/material.dart';
import 'package:pumptrack/constants/app.dart';
import 'package:pumptrack/styles/colors.dart';

extension NavigationThroughString on String {
  Future<dynamic> pushName() async {
    return AppConstants.navigationKey.currentState?.pushNamed(
      this,
    );
  }
}

extension ContextExtension on BuildContext {
  Size get mediaQuerySize => MediaQuery.of(this).size;

  void showSnackBar(String? message, {bool isError = false}) =>
      ScaffoldMessenger.of(this)
        ..removeCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            backgroundColor: AppColors.blue,
            content: Text(message ?? ''),
          ),
        );
}
