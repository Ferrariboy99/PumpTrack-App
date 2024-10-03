import 'package:flutter/material.dart';
import 'package:pumptrack/constants/routes.dart';
import 'package:pumptrack/constants/texts.dart';
import 'package:pumptrack/main.dart';
import 'package:pumptrack/styles/colors.dart';
import 'package:pumptrack/styles/styles.dart';
import 'package:pumptrack/utils/extensions.dart';

import '../constants/assets.dart';
import '../constants/icons.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 0,
        backgroundColor: AppColors.background,
        child: SizedBox(
            height: MainApp.screenHeight * 0.5,
            width: MainApp.screenWidth * 0.75,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildUserDetails(),
                Divider(color: AppColors.grey, thickness: 0.2),
                Expanded(child: Column(children: buildProfileOptions()))
              ],
            )));
  }

  // user details
  Widget buildUserDetails() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
              radius: 30,
              backgroundColor: AppColors.grey,
              child: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(Assets.emptyUserImage))))),
          const SizedBox(width: 10),
          Text(
            'festus@gmail.com',
            style: TextStyle(color: AppColors.black, fontSize: 17),
          ),
        ],
      ),
    );
  }

  // profile options
  List<ListTile> buildProfileOptions() {
    return List.generate(
        4,
        (index) => ListTile(
              onTap: () {
                switch (index) {
                  case 1:
                    AppRoutes.settings.pushName();
                    break;
                  case 2:
                    AppRoutes.help_and_feedback.pushName();
                    break;
                }
              },
              leading: Icon(
                AppIcons.profileIcons[index],
                color: index != 3 ? AppColors.grey : AppColors.red,
              ),
              title: Text(
                AppTexts.profileOptions[index],
                style: TextStyle(
                    color: index != 3 ? AppColors.black : AppColors.red),
              ),
            ));
  }
}
