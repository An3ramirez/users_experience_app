import 'package:flutter/material.dart';
import 'package:users_experience_app/src/domain/constants/constants.dart';
import 'package:users_experience_app/src/ui/helpers/helpers.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);

    return Container(
      height: responsive.hp(20),
      alignment: Alignment.topCenter,
      margin: const EdgeInsets.all(50.0),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(backgroundImage),
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
