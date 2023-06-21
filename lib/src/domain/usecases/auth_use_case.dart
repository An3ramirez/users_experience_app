import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:users_experience_app/src/data/models/models.dart';
import 'package:users_experience_app/src/data/repositories/user_repository_impl.dart';
import 'package:users_experience_app/src/domain/entities/auth_result.dart';
import 'package:users_experience_app/src/domain/repositories/user_repository.dart';

class AuthUseCase {
  final UserRepository _userRepository;

  AuthUseCase(this._userRepository);

  Future<AuthResult> logIn(User user) async {
    // Realiza la lógica de inicio de sesión utilizando el repositorio de autenticación
    return await _userRepository.logIn(user);
  }

  Future<AuthResult> signUp(Person person) async {
    // Realiza la lógica de registro utilizando el repositorio de autenticación
    return await _userRepository.signUp(person);
  }
}

final authUseCaseProvider = Provider(
  (ref) => AuthUseCase(UserRepositoryImpl()),
);
