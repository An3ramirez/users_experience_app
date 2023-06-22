import 'package:flutter_test/flutter_test.dart';
import 'package:users_experience_app/src/data/models/models.dart';
import 'package:users_experience_app/src/domain/repositories/user_repository.dart';
import 'package:users_experience_app/src/data/repositories/user_repository_impl.dart';

void main() {
  group('UserRepositoryImpl', () {
    late UserRepository userRepository;

    setUp(() {
      userRepository = UserRepositoryImpl();
    });

    test(
        'logIn should return AuthResult with success message if valid credentials are provided',
        () async {
      // Arrange
      final user = User(userName: 'pepito', password: '123');

      // Act
      final authResult = await userRepository.logIn(user);

      // Assert
      expect(authResult.status, true);
      expect(authResult.message, 'Succes welcome user');
    });

    test(
        'logIn should return AuthResult with failure message if invalid credentials are provided',
        () async {
      // Arrange
      final user = User(userName: 'john.doe', password: 'wrongpassword');

      // Act
      final authResult = await userRepository.logIn(user);

      // Assert
      expect(authResult.status, false);
      expect(authResult.message, 'Credenciales incorrectas');
    });

    test(
        'signUp should return AuthResult with success message after registering a user',
        () async {
      // Arrange
      final person = Person(
          name: 'John',
          lastname: 'Doe',
          birthDate: '1990-01-01',
          addresses: [],
          userName: 'john.doe',
          password: 'password');

      // Act
      final authResult = await userRepository.signUp(person);

      // Assert
      expect(authResult.status, true);
      expect(authResult.message, 'Usuario registrado con exito');
    });

    test(
        'signUp should return AuthResult with success message after registering a user',
        () async {
      // Arrange
      final person = Person(
          name: 'John',
          lastname: 'Doe',
          birthDate: '1990-01-01',
          addresses: [],
          userName: 'john.doe',
          password: 'password');

      // Act
      final authResult = await userRepository.signUp(person);

      // Assert
      expect(authResult.status, true);
      expect(authResult.message, 'Usuario registrado con exito');
    });
  });
}
