import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pumptrack/bottom_nav.dart';
import 'package:pumptrack/constants/app.dart';
import 'package:pumptrack/constants/routes.dart';
import 'package:pumptrack/screens/home.dart';
import 'package:pumptrack/screens/signup.dart';
import 'package:pumptrack/styles/colors.dart';
import 'package:pumptrack/styles/theme.dart';

import 'screens/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
        statusBarColor: AppColors.blue,
        systemNavigationBarColor: AppColors.background),
  );
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  ).then(
    (_) => runApp(const MainApp()),
  );
}

class MainApp extends StatefulWidget {
  static double screenHeight = 0;
  static double screenWidth = 0;
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    MainApp.screenHeight = MediaQuery.of(context).size.height;
    MainApp.screenWidth = MediaQuery.of(context).size.width;

    Theme.of(context);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        locale: const Locale('en', ''),
        theme: AppTheme.lightTheme,
        // initial home route
        initialRoute: AppRoutes.login,
        navigatorKey: AppConstants.navigationKey,
        routes: {
          AppRoutes.login: (context) => const Login(),
          AppRoutes.signUp: (context) => const SignUp(),
          AppRoutes.home: (context) => const Home(),
          AppRoutes.bottomNav: (context) => const BottomNavBar(),
        });
    // initialize app routes
  }
}
