// ignore_for_file: constant_identifier_names

import 'package:flutter/cupertino.dart';

import 'package:users_experience_app/src/routes/routes.dart';

/** Pages */
import 'package:users_experience_app/src/ui/pages/root_page.dart';
import 'package:users_experience_app/src/ui/pages/login/login_page.dart';
import 'package:users_experience_app/src/ui/pages/signup/signup_page.dart';
import 'package:users_experience_app/src/ui/pages/welcome/welcome_page.dart';

abstract class Pages {
  //static const String INITIAL = Routes.LOADING;
  static const String INITIAL = Routes.WELCOME;
  static const String HOME = Routes.ROOT;

  static final Map<String, Widget Function(BuildContext)> routes = {
    Routes.ROOT: (_) => const RootPage(),
    Routes.WELCOME: (_) => const WelcomePage(),
    Routes.LOGIN: (_) => LoginPage(),
    Routes.SIGNUP: (_) => SignupPage(),
  };
}
