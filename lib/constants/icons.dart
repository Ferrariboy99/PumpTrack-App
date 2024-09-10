import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class AppIcons{
  // =========== nav bar =========== //
  static Map<String, IconData> navFilledIcons = {
    'home': FluentIcons.home_12_filled,
    'explore': FluentIcons.location_16_filled,
    'alerts': FluentIcons.alert_16_filled,
    'pumpList': FluentIcons.list_16_filled
  };

  static Map<String, IconData> navRegularIcons = {
    'home': FluentIcons.home_12_regular,
    'explore': FluentIcons.location_16_regular,
    'alerts': FluentIcons.alert_16_regular,
    'pumpList': FluentIcons.list_16_regular

  };
}