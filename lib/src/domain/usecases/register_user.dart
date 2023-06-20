import 'package:users_experience_app/src/domain/entities/user.dart';
import 'package:users_experience_app/src/domain/repositories/user_repository.dart';

class RegisterUser {
  final UserRepository userRepository;

  RegisterUser(this.userRepository);

  Future<void> call(User user) async {
    // Aquí puedes agregar lógica adicional, como validaciones antes de registrar al usuario
    await userRepository.registerUser(user);
  }
}
