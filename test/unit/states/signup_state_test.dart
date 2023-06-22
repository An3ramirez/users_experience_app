import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:users_experience_app/src/data/models/models.dart';
import 'package:users_experience_app/src/domain/entities/auth_result.dart';
import 'package:users_experience_app/src/domain/enums/enum_request_status.dart';
import 'package:users_experience_app/src/domain/use_cases/auth_use_case.dart';
import 'package:users_experience_app/src/ui/pages/signup/signup_state.dart';

import 'login_state_test.mocks.dart';

@GenerateMocks([AuthUseCase])
void main() {
  group('SignUpNotifier', () {
    late ProviderContainer container;
    late SignUpNotifier signUpNotifier;
    late MockAuthUseCase mockAuthUseCase;

    setUp(() {
      container = ProviderContainer();
      mockAuthUseCase = MockAuthUseCase();
      signUpNotifier = SignUpNotifier(mockAuthUseCase);
    });

    tearDown(() {
      container.dispose();
    });

    test('signUp sets loading status and returns AuthResult on success',
        () async {
      // Arrange
      final person = Person(
          name: 'John Doe',
          lastname: '',
          birthDate: '',
          addresses: [],
          userName: 'test@example.com',
          password: '');
      final expectedAuthResult = AuthResult(status: true);
      when(mockAuthUseCase.signUp(person))
          .thenAnswer((_) async => expectedAuthResult);

      // Act
      final result = await signUpNotifier.signUp(person);

      // Assert
      expect(signUpNotifier.currentState.status, RequestStatusEnum.success);
      expect(result, isInstanceOf<AuthResult>());
      verify(mockAuthUseCase.signUp(person)).called(1);
    });

    test('signUp sets loading status and returns AuthResult on failure',
        () async {
      // Arrange
      final person = Person(
          name: 'John Doe',
          lastname: '',
          birthDate: '',
          addresses: [],
          userName: 'test@example.com',
          password: '');
      final error = Exception('Error occurred');
      when(mockAuthUseCase.signUp(person)).thenThrow(error);

      // Act
      final result = await signUpNotifier.signUp(person);

      // Assert
      expect(signUpNotifier.currentState.status, RequestStatusEnum.failed);
      expect(result, isNotNull);
      expect(result, isInstanceOf<AuthResult>());
      expect(result.message, error.toString());
      verify(mockAuthUseCase.signUp(person)).called(1);
    });
  });
}
