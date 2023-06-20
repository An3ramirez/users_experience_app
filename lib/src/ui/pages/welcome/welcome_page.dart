import 'package:flutter/material.dart';
import 'package:users_experience_app/src/helpers/responsive.dart';
import 'package:users_experience_app/src/routes/routes.dart';
import 'package:users_experience_app/src/ui/global_widgets/background_image.dart';
import 'package:users_experience_app/src/ui/global_widgets/round_button.dart';

import 'package:users_experience_app/src/domain/constants/constants.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);

    return SafeArea(
      child: Stack(
        children: [
          const BackgroundImage(),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: responsive.hp(40),
                      ),
                      const RoundButton(
                        textBtn: 'Sign up',
                        paddingHorizontal: 80.0,
                        paddingVertical: 20,
                      ),
                      RoundButton(
                        textBtn: 'Log in',
                        color: Colors.white,
                        paddingHorizontal: 80.0,
                        onPressed: () =>
                            Navigator.pushNamed(context, Routes.LOGIN),
                      ),
                      const SizedBox(height: 30),
                      Text(
                        'Forgot password?',
                        style: textWhite.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.normal,
                          decoration: TextDecoration.underline,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
