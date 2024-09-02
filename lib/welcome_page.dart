import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to PumpTrack!'),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/pump_list');
              },
              child: Text('View Pumps'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/map');
              },
              child: Text('Explore Map'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/alerts');
              },
              child: Text('View Alerts'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/profile');
              },
              child: Text('Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
