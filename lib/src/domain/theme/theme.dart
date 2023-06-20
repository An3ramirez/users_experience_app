import 'package:flutter/material.dart';
import 'package:users_experience_app/src/helpers/palette.dart';

import '../constants/constants.dart';

ThemeData channelTheme = ThemeData(
  fontFamily: 'Gilroy',
  primarySwatch: Palette.getMaterialColorFromColor(lightColor),
  primaryTextTheme: const TextTheme(headline6: TextStyle(color: lightColor)),
  useMaterial3: true,
  //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  textTheme: const TextTheme(
    bodyText2: TextStyle(color: lightColor),
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
