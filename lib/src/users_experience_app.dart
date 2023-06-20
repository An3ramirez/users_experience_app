import 'package:flutter/material.dart';
import 'package:users_experience_app/src/routes/pages.dart';

import 'domain/constants/constants.dart' show appName;
import 'ui/helpers/theme/theme.dart';

class UserExperienceApp extends StatelessWidget {
  const UserExperienceApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      theme: channelTheme,
      initialRoute: Pages.INITIAL,
      routes: Pages.routes,
    );
  }
}
