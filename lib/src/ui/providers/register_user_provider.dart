import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:users_experience_app/src/data/repositories/user_repository_impl.dart';
import 'package:users_experience_app/src/domain/entities/user.dart';
import 'package:users_experience_app/src/domain/repositories/user_repository.dart';
import 'package:users_experience_app/src/domain/usecases/register_user.dart';

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepositoryImpl();
});

final registerUserUseCaseProvider = Provider<RegisterUser>((ref) {
  final userRepository = ref.watch(userRepositoryProvider);
  return RegisterUser(userRepository);
});

final registerUserProvider = FutureProvider.autoDispose<void>((ref) async {
  final registerUserUseCase = ref.watch(registerUserUseCaseProvider);
  final user = User(
      id: '1',
      name: 'John Doe',
      email: 'johndoe@example.com',
      password: 'password');

  await registerUserUseCase(user);
});
