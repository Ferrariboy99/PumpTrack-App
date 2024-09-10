import 'package:flutter/material.dart';
import 'package:pumptrack/main.dart';
import 'package:pumptrack/styles/colors.dart';
import 'package:pumptrack/styles/text_styles.dart';
import 'package:pumptrack/widgets/app_bar.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBlue,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(54), child: getAppBar()),
      body: SingleChildScrollView(
          child: SizedBox(
        height: MainApp.screenHeight * 0.85,
        child: getBodyContainer(),
      )),
    );
  }

  // appBar
  Widget getAppBar() {
    return CustomAppBar(
      title: 'PumpTrack',
      centerTile: false,
      titleColor: AppColors.white,
      appBarColor: AppColors.darkBlue,
    );
  }

  // body container
  Widget getBodyContainer() {
    return Column(children: [
      SizedBox(
        height: MainApp.screenHeight * 0.3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '0',
              style: TextStyles.headerWhite,
            ),
            Text(
              'Active pumps',
              style: TextStyles.normalWhiteText,
            ),
          ],
        ),
      ),
      getWave(),
      Expanded(child: bodyContent())
    ]);
  }

  // body with more details
  Widget bodyContent() {
    return Container(
      width: double.infinity,
      color: AppColors.background,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text('Coming soon')],
      ),
    );
  }

  // wave container
  Widget getWave() {
    return Container(
        height: 80,
        color: AppColors.darkBlue,
        child: WaveWidget(
          config: CustomConfig(
            colors: [AppColors.dividers, AppColors.background],
            durations: [3500, 1944],
            heightPercentages: [0.25, 0.35],
          ),
          waveAmplitude: 0,
          size: const Size(double.infinity, 80.0),
        ));
  }
}
