import 'package:flutter/foundation.dart';
import 'package:users_experience_app/src/data/data_source/local/fake_data.dart';
import 'package:users_experience_app/src/data/models/models.dart';

import 'package:users_experience_app/src/domain/entities/auth_result.dart';
import 'package:users_experience_app/src/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  @override
  Future<AuthResult> logIn(User user) async {
    await Future.delayed(const Duration(seconds: 2));
    User isName = fakeUsers.firstWhere(
      (element) => element.userName == user.userName,
      orElse: () => emptyUser(),
    );
    User isPassword = fakeUsers.firstWhere(
      (element) => element.password == user.password,
      orElse: () => emptyUser(),
    );
    if (isName.userName != '' && isPassword.password != '') {
      return AuthResult(
        message: 'Succes welcome user',
        status: true,
        aditionalData: getRandomString(15),
      );
    }
    return AuthResult(message: 'Credenciales incorrectas');
  }

  @override
  Future<AuthResult> signUp(Person person) async {
    await Future.delayed(const Duration(seconds: 2));
    if (kDebugMode) {
      print('Usuario registrado: ${person.name}');
    }
    return AuthResult(
      message: 'Usuario registrado con exito',
      status: true,
      aditionalData: getRandomString(20),
    );
  }
}
