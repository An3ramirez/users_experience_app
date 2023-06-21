import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:users_experience_app/src/domain/constants/constants.dart';
import 'package:users_experience_app/src/domain/entities/requestStatus.dart';
import 'package:users_experience_app/src/domain/enums/enum_request_status.dart';
import 'package:users_experience_app/src/ui/helpers/helpers.dart';
import 'package:users_experience_app/src/ui/global_widgets/birthday_picker.dart';
import 'package:users_experience_app/src/ui/global_widgets/custom_input.dart';
import 'package:users_experience_app/src/ui/pages/signup/signup_state.dart';

class SignupPage extends ConsumerStatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  SignupPageState createState() => SignupPageState();
}

class SignupPageState extends ConsumerState<SignupPage> {
  final nameCtrl = TextEditingController();
  final lastnameCtrl = TextEditingController();
  final birthDateCtrl = TextEditingController();
  final addressCtrl = TextEditingController();
  final userNameCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    final RequestStatus signInState = ref.watch(signUpStateProvider);
    final bool loading = signInState.status == RequestStatusEnum.loading;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            height: responsive.height,
            child: Column(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(top: 50, bottom: 50),
                  child: Text(
                    'SignUp!',
                    style: textWhite,
                  ),
                ),
                _formSignup(context, loading),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _formSignup(BuildContext context, bool loading) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          CustomInput(placeholder: 'Nombre', textController: nameCtrl),
          CustomInput(placeholder: 'Apellido', textController: lastnameCtrl),
          BirthdayPicker(
              onDateSelected: (value) => birthDateCtrl.text = value.toString()),
          CustomInput(placeholder: 'Dirección', textController: addressCtrl),
          CustomInput(placeholder: 'Usuario', textController: userNameCtrl),
          CustomInput(
              placeholder: 'Contraseña',
              isPassword: true,
              textController: passwordCtrl),
          ElevatedButton(
            onPressed: loading ? null : _registerUser,
            child: Text(loading ? 'Cargando' : 'Registrarse'),
          ),
        ],
      ),
    );
  }

  void _registerUser() {
    /* final registerUserUseCase = ref.read(registerUserUseCaseProvider);
    final person = Person(
        name: nameCtrl.text,
        lastname: lastnameCtrl.text,
        birthDate: birthDateCtrl.text,
        address: addressCtrl.text,
        userName: userNameCtrl.text,
        password: passwordCtrl.text);

    registerUserUseCase(person).then((_) {
      // Registro exitoso, realiza alguna acción adicional si es necesario
    }).catchError((error) {
      // Manejo de errores en el registro de usuario
    }); */
  }
}
