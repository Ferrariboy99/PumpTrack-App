import 'package:flutter/material.dart';
import 'package:pumptrack/widgets/empty_animation.dart';

import '../styles/styles.dart';
import '../widgets/app_bar.dart';

class Alert extends StatefulWidget {
  const Alert({super.key});

  @override
  State<Alert> createState() => _AlertState();
}

class _AlertState extends State<Alert> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(54),
          child: CustomAppBar(
              title: 'Alerts',
              centerTile: true,
              titleColor: AppColors.white,
              appBarColor: AppColors.darkBlue,
              iconThemeColor: AppColors.blackText)),
      body: const EmptyAnimation(message: 'No alerts yet'),
    );
  }
}
