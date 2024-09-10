import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:pumptrack/constants/icons.dart';
import 'package:pumptrack/constants/texts.dart';
import 'package:pumptrack/screens/explore.dart';
import 'package:pumptrack/screens/home.dart';
import 'package:pumptrack/styles/colors.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int initialPage = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> buildScreens() {
      return [const Home(), const Explore(), const Explore(), const Explore()];
    }

    List<PersistentBottomNavBarItem> navBarsItems() {
      return [
        _getNavItem(AppIcons.navFilledIcons['home']!,
            AppIcons.navFilledIcons['home']!, AppTexts.navBar[0]),
        _getNavItem(AppIcons.navFilledIcons['explore']!,
            AppIcons.navRegularIcons['explore']!, AppTexts.navBar[1]),
        _getNavItem(AppIcons.navFilledIcons['alerts']!,
            AppIcons.navRegularIcons['alerts']!, AppTexts.navBar[2]),
        _getNavItem(AppIcons.navFilledIcons['pumpList']!,
            AppIcons.navFilledIcons['pumpList']!, AppTexts.navBar[3])
      ];
    }

    PersistentTabController controller;
    controller = PersistentTabController(initialIndex: initialPage);
    return Scaffold(
        body: PersistentTabView(context, onItemSelected: (value) {
      setState(() {});
    },
            screens: buildScreens(),
            padding: const EdgeInsets.symmetric(vertical: 5),
            items: navBarsItems(),
            controller: controller,
            confineToSafeArea: true,
            backgroundColor: AppColors.background,
            handleAndroidBackButtonPress: true,
            resizeToAvoidBottomInset: true,
            stateManagement: true,
            popBehaviorOnSelectedNavBarItemPress: PopBehavior.all,
            decoration: NavBarDecoration(
                border: BorderDirectional(
                    top: BorderSide(color: AppColors.dividers, width: 0.5))),
            navBarStyle: NavBarStyle.simple));
  }
}

PersistentBottomNavBarItem _getNavItem(
    IconData icon, IconData inactive, String title) {
  return PersistentBottomNavBarItem(
    icon: Icon(
      icon,
      size: 28,
    ),
    inactiveIcon: Icon(
      inactive,
      size: 28,
    ),
    title: (title),
    textStyle: const TextStyle(fontSize: 10),
    activeColorPrimary: AppColors.blackText,
    inactiveColorPrimary: AppColors.grey,
  );
}
