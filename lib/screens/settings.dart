import 'package:flutter/material.dart';
import 'package:pumptrack/styles/colors.dart';
import 'package:pumptrack/widgets/app_bar.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(54),
            child: CustomAppBar(
                title: 'Settings',
                centerTile: true,
                titleColor: AppColors.blackText,
                appBarColor: AppColors.background,
                iconThemeColor: AppColors.blackText)));
  }
}
