import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:users_experience_app/src/routes/routes.dart';

import 'package:users_experience_app/src/helpers/helpers.dart';
import 'package:users_experience_app/src/domain/constants/constants.dart';

/** Global widgets */
import 'package:users_experience_app/src/ui/global_widgets/background_image.dart';
import 'package:users_experience_app/src/ui/global_widgets/custom_input.dart';
import 'package:users_experience_app/src/ui/global_widgets/round_button.dart';

class LoginPage extends ConsumerStatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final nameCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);

    return SafeArea(
      child: Stack(
        children: [
          const BackgroundImage(),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: SizedBox(
                height: responsive.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.only(top: 50),
                      child: Text(
                        'Welcome!',
                        style: textWhite,
                      ),
                    ),
                    _formLogin(context, false)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _formLogin(BuildContext context, bool loading) {
    return Container(
      height: 420,
      width: double.infinity,
      padding: const EdgeInsets.all(25.0),
      decoration: BoxDecoration(
        color: Colors.grey[900]?.withOpacity(0.9),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
      ),
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.topRight,
            child: InkWell(
              onTap: () => Navigator.pushNamed(context, Routes.WELCOME),
              child: const Icon(
                Icons.close,
                color: Colors.white54,
              ),
            ),
          ),
          CustomInput(placeholder: 'Name', textController: nameCtrl),
          CustomInput(
            placeholder: 'Password',
            textController: passCtrl,
            isPassword: true,
          ),
          const SizedBox(height: 40),
          RoundButton(
            textBtn: loading ? 'Loading...' : 'Log in',
            color: Colors.white,
            onPressed: loading ? null : () => onLogin(),
          ),
        ],
      ),
    );
  }

  void onLogin() async {
    FocusScope.of(context).unfocus();
    var status = true;

    if (status) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        Routes.ROOT,
        (_) => false,
      );
    } else {
      showSnackBar(context, 'authRepository.message');
    }
  }
}