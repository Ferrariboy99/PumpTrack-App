import 'package:flutter/material.dart';

import '../styles/styles.dart';
import '../widgets/app_bar.dart';

class HelpAndFeedback extends StatelessWidget {
  const HelpAndFeedback({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(54),
          child: CustomAppBar(
              title: 'Help and Feedback',
              centerTile: true,
              titleColor: AppColors.blackText,
              appBarColor: AppColors.background,
              iconThemeColor: AppColors.blackText)),
    );
  }
}
