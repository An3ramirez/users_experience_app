import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:users_experience_app/src/data/models/address.dart';
import 'package:users_experience_app/src/data/models/models.dart';
import 'package:users_experience_app/src/domain/constants/constants.dart';
import 'package:users_experience_app/src/domain/entities/auth_result.dart';
import 'package:users_experience_app/src/domain/entities/request_status.dart';
import 'package:users_experience_app/src/domain/enums/enum_request_status.dart';
import 'package:users_experience_app/src/routes/routes.dart';
import 'package:users_experience_app/src/ui/global_widgets/list_address.dart';
import 'package:users_experience_app/src/ui/global_widgets/round_button.dart';
import 'package:users_experience_app/src/ui/helpers/helpers.dart';
import 'package:users_experience_app/src/ui/global_widgets/birthday_picker.dart';
import 'package:users_experience_app/src/ui/global_widgets/custom_input.dart';
import 'package:users_experience_app/src/ui/pages/signup/address_form.dart';
import 'package:users_experience_app/src/ui/pages/signup/signup_state.dart';
import 'package:users_experience_app/src/ui/providers/person_provider.dart';

class SignupPage extends ConsumerStatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  SignupPageState createState() => SignupPageState();
}

class SignupPageState extends ConsumerState<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final _formAddressKey = GlobalKey<AddressFormState>();
  final nameCtrl = TextEditingController();
  final lastnameCtrl = TextEditingController();
  final birthDateCtrl = TextEditingController();
  final userNameCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final List<Address> addresses = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final RequestStatus signInState = ref.watch(signUpStateProvider);
    final bool loading = signInState.status == RequestStatusEnum.loading;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
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
    return Form(
      key: _formKey,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            CustomInput(
              placeholder: 'Nombre',
              textController: nameCtrl,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Este campor es requerido';
                }
                return null;
              },
            ),
            CustomInput(
              placeholder: 'Apellido',
              textController: lastnameCtrl,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Este campor es requerido';
                }
                return null;
              },
            ),
            BirthdayPicker(
                onDateSelected: (value) => birthDateCtrl.text = value),
            ElevatedButton.icon(
              onPressed: () => showFormAddress(),
              icon: const Icon(Icons.add),
              label: const Text('Agregar Dirección'),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: addresses.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: ListAddress(address: addresses[index], index: index),
                );
              },
            ),
            CustomInput(
              placeholder: 'Usuario',
              textController: userNameCtrl,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Este campo es requerido';
                }
                return null;
              },
            ),
            CustomInput(
              placeholder: 'Contraseña',
              isPassword: true,
              textController: passwordCtrl,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Este campor es requerido';
                }
                return null;
              },
            ),
            RoundButton(
              textBtn: loading ? 'Cargando...' : 'Registrarse',
              onPressed: loading ? null : _registerUser,
            ),
          ],
        ),
      ),
    );
  }

  void showFormAddress() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Ingrese dirección'),
        content: AddressForm(
          key: _formAddressKey,
          onSubmit: (value) {
            addresses.add(value);
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              bool formIsValid =
                  _formAddressKey.currentState?.submitForm() ?? false;
              if (formIsValid) {
                Navigator.of(context).pop();
              }
              setState(() {});
            },
            child: const Text('Agregar'),
          ),
        ],
      ),
      barrierDismissible: false,
    );
  }

  void _registerUser() async {
    if (_formKey.currentState?.validate() == false) {
      showSnackBar(context, 'Por favor revise el formulario');
      return;
    }

    final person = Person(
      name: nameCtrl.text,
      lastname: lastnameCtrl.text,
      birthDate: birthDateCtrl.text,
      addresses: addresses,
      userName: userNameCtrl.text,
      password: passwordCtrl.text,
    );

    AuthResult authResult =
        await ref.read(signUpStateProvider.notifier).signUp(person);

    navigateOrError(authResult, person);
  }

  void navigateOrError(AuthResult authResult, Person person) {
    if (authResult.status) {
      ref.read(personProvider.notifier).update((state) => person);
      Navigator.pushNamedAndRemoveUntil(
        context,
        Routes.HOME,
        (_) => false,
      );
    } else {
      showSnackBar(context, authResult.message);
    }
  }
}
