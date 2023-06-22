import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:users_experience_app/src/data/models/models.dart';
import 'package:users_experience_app/src/domain/entities/auth_result.dart';
import 'package:users_experience_app/src/domain/repositories/user_repository.dart';
import 'package:users_experience_app/src/domain/use_cases/auth_use_case.dart';
import 'auth_use_case_test.mocks.dart';

@GenerateMocks([UserRepository])
void main() {
  late AuthUseCase authUseCase;
  late MockUserRepository mockUserRepository;

  setUp(() {
    mockUserRepository = MockUserRepository();
    authUseCase = AuthUseCase(mockUserRepository);
  });

  group('AuthUseCase', () {
    final user = User(
      userName: 'test@example.com',
      password: 'password',
    );

    test('logIn should return AuthResult', () async {
      final authResult = AuthResult(status: true);
      when(mockUserRepository.logIn(user)).thenAnswer((_) async => authResult);

      final result = await authUseCase.logIn(user);

      expect(result, authResult);
      verify(mockUserRepository.logIn(user)).called(1);
    });

    test('signUp should return AuthResult', () async {
      final person = Person(
          name: 'John',
          lastname: 'Rangel',
          birthDate: '30',
          addresses: [],
          userName: '',
          password: '');
      final authResult = AuthResult(status: true);
      when(mockUserRepository.signUp(person))
          .thenAnswer((_) async => authResult);

      final result = await authUseCase.signUp(person);

      expect(result, authResult);
      verify(mockUserRepository.signUp(person)).called(1);
    });
  });
}
