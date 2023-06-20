import 'package:users_experience_app/src/domain/entities/user.dart';

abstract class UserRepository {
  Future<void> registerUser(User user);
}
