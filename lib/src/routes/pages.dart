// ignore_for_file: constant_identifier_names

import 'package:flutter/cupertino.dart';

import 'package:users_experience_app/src/routes/routes.dart';

/** Pages */
import 'package:users_experience_app/src/ui/pages/home/home_page.dart';
import 'package:users_experience_app/src/ui/pages/login/login_page.dart';
import 'package:users_experience_app/src/ui/pages/profile/profile_page.dart';
import 'package:users_experience_app/src/ui/pages/signup/signup_page.dart';
import 'package:users_experience_app/src/ui/pages/welcome/welcome_page.dart';

abstract class Pages {
  static const String INITIAL = Routes.WELCOME;
  static const String HOME = Routes.HOME;

  static final Map<String, Widget Function(BuildContext)> routes = {
    Routes.HOME: (_) => const HomePage(),
    Routes.WELCOME: (_) => const WelcomePage(),
    Routes.LOGIN: (_) => const LoginPage(),
    Routes.SIGNUP: (_) => const SignupPage(),
    Routes.PROFILE: (_) => const ProfilePage(),
  };
}
