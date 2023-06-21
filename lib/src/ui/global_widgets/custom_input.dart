import 'package:flutter/material.dart';
import 'package:users_experience_app/src/domain/constants/constants.dart';

class CustomInput extends StatelessWidget {
  final String placeholder;
  final TextEditingController textController;
  final TextInputType keyboardType;
  final bool isPassword;
  final String? Function(String?)? validator;

  const CustomInput({
    Key? key,
    required this.placeholder,
    required this.textController,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 5, left: 5, bottom: 5, right: 20),
      margin: const EdgeInsets.only(bottom: marginBottonCustomInputs),
      child: TextFormField(
        keyboardType: keyboardType,
        obscureText: isPassword,
        controller: textController,
        cursorColor: Colors.white,
        validator: validator,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: placeholder,
          hintStyle: const TextStyle(
            color: textInputColor,
            fontSize: 20,
            fontWeight: FontWeight.normal,
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white38),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white38),
          ),
        ),
      ),
    );
  }
}
