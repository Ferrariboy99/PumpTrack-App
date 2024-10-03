import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:pumptrack/constants/assets.dart';
import 'package:pumptrack/constants/icons.dart';
import 'package:pumptrack/constants/texts.dart';
import 'package:pumptrack/main.dart';
import 'package:pumptrack/screens/add_pump.dart';
import 'package:pumptrack/screens/profile.dart';
import 'package:pumptrack/styles/colors.dart';
import 'package:pumptrack/styles/styles.dart';
import 'package:pumptrack/styles/text_styles.dart';
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
        height: MainApp.screenHeight * 0.9,
        child: getBodyContainer(),
      )),
    );
  }

  // appBar
  Widget getAppBar() {
    return AppBar(
      iconTheme: IconThemeData(color: AppColors.white),
      surfaceTintColor: AppColors.darkBlue,
      backgroundColor: AppColors.darkBlue,
      shadowColor: AppColors.grey,
      elevation: 0.2,
      title: Text(
        'PumpTrack',
        style: TextStyle(color: AppColors.white, fontSize: 25),
      ),
      actions: [
        IconButton(
            onPressed: () {}, icon: const Icon(FluentIcons.search_12_regular)),
        GestureDetector(
          onTap: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const ProfilePage();
                });
          },
          child: CircleAvatar(
              backgroundColor: AppColors.grey,
              child: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(Assets.emptyUserImage))))),
        ),
        const SizedBox(
          width: 10,
        )
      ],
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
              '2',
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
      color: AppColors.dividers,
      padding: const EdgeInsetsDirectional.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textContainer('Quick Actions'),
          getOptions(),
          textContainer('My Pumps'),
          Flexible(child: getPumps())
        ],
      ),
    );
  }

  //
  Widget textContainer(String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: TextStyles.normalBlackBoldText,
      ),
    );
  }

// home options
  Widget getOptions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        3,
        (index) => Flexible(
            child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                child: FilledButton(
                    style: ButtonStyle(
                      iconColor: MaterialStatePropertyAll(AppColors.black),
                      fixedSize:
                          const MaterialStatePropertyAll(Size.fromHeight(50)),
                      backgroundColor:
                          MaterialStatePropertyAll(AppColors.white),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                    ),
                    onPressed: () {
                      switch (index) {
                        case 0:
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const AddPump();
                              });
                      }
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          AppIcons.homeOptions[index],
                        ),
                        Text(
                          AppTexts.homeOptions[index],
                          style: TextStyle(
                              color: AppColors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 15),
                        ),
                      ],
                    )))),
      ),
    );
  }

  // get pumps
  Widget getPumps() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Card(
            color: AppColors.white,
            elevation: 0,
            child: ListTile(
              onTap: () {
                displayTableDetails(
                    context,
                    AppTexts.mockPumpNames[index],
                    AppTexts.mockPumpDescriptions[index],
                    AppTexts.mockPumpLocations[index]);
              },
              title: Text(AppTexts.mockPumpNames[index]),
              subtitle: Text(
                AppTexts.mockPumpDescriptions[index],
                style: TextStyle(color: AppColors.grey),
              ),
              trailing: Text(AppTexts.mockPumpLocations[index]),
            ));
      },
      itemCount: AppTexts.mockPumpNames.length,
    );
  }

  // wave container
  Widget getWave() {
    return Container(
        height: 80,
        color: AppColors.darkBlue,
        child: WaveWidget(
          config: CustomConfig(
            colors: [AppColors.white, AppColors.dividers],
            durations: [3500, 1944],
            heightPercentages: [0.25, 0.35],
          ),
          waveAmplitude: 0,
          size: const Size(double.infinity, 80.0),
        ));
  }
}

Future displayTableDetails(context, name, description, location) {
  return showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.white,
      elevation: 0,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topRight: Radius.circular(25))),
      builder: (context) => Container(
          padding: const EdgeInsets.all(15.0),
          height: 320,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Pump Details',
                    style: TextStyle(color: AppColors.darkBlue, fontSize: 25),
                  ),
                ),
                const SizedBox(height: 20),
                getTile(Icons.water, 'Pump Name', name),
                getTile(Icons.info_outline, 'Description', description),
                getTile(FluentIcons.location_12_regular, 'Location', location),
              ],
            ),
          )));
}

Widget getTile(IconData icon, String title, String subtitle) {
  return ListTile(
    leading: Icon(icon, color: AppColors.darkBlue),
    title: Text(title, style: TextStyle(color: AppColors.black)),
    subtitle: Text(subtitle, style: TextStyle(color: AppColors.blue)),
  );
}
