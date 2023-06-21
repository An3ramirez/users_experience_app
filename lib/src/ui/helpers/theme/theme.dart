import 'package:flutter/material.dart';
import 'package:users_experience_app/src/ui/helpers/palette.dart';

import '../../../domain/constants/constants.dart';

ThemeData channelTheme = ThemeData(
  fontFamily: 'Gilroy',
  primarySwatch: Palette.getMaterialColorFromColor(lightColor),
  primaryTextTheme: const TextTheme(titleLarge: TextStyle(color: lightColor)),
  useMaterial3: true,
  //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(color: lightColor),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: primaryColor,
    foregroundColor: lightColor,
    centerTitle: true,
    elevation: 0,
    toolbarHeight: kToolbarHeight,
    systemOverlayStyle: uiOverlayStyle,
  ),
  scaffoldBackgroundColor: primaryColor,
);
