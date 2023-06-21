import 'package:users_experience_app/src/data/models/models.dart';
import 'package:users_experience_app/src/domain/entities/auth_result.dart';

abstract class UserRepository {
  Future<AuthResult> signIn(User user);
  Future<AuthResult> signUp(Person person);
}
