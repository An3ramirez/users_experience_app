import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:users_experience_app/src/data/models/models.dart';
import 'package:users_experience_app/src/domain/entities/auth_result.dart';
import 'package:users_experience_app/src/domain/enums/enum_request_status.dart';
import 'package:users_experience_app/src/domain/use_cases/auth_use_case.dart';
import 'package:users_experience_app/src/ui/pages/login/login_state.dart';

import 'login_state_test.mocks.dart';

// Mock del AuthUseCase
@GenerateMocks([AuthUseCase])
void main() {
  group('LogInNotifier', () {
    late ProviderContainer container;
    late LogInNotifier logInNotifier;
    late MockAuthUseCase mockAuthUseCase;

    setUp(() {
      container = ProviderContainer();
      mockAuthUseCase = MockAuthUseCase();
      logInNotifier = LogInNotifier(mockAuthUseCase);
    });

    tearDown(() {
      container.dispose();
    });

    test('sigIn sets loading status and returns AuthResult on success',
        () async {
      // Arrange
      final user = User(userName: 'test@example.com', password: 'password');
      final expectedAuthResult = AuthResult(status: true);
      when(mockAuthUseCase.logIn(user))
          .thenAnswer((_) async => expectedAuthResult);

      // Act
      final result = await logInNotifier.sigIn(user);

      // Assert
      expect(logInNotifier.currentState.status, RequestStatusEnum.success);
      expect(result, expectedAuthResult);
      verify(mockAuthUseCase.logIn(user)).called(1);
    });

    test('sigIn sets loading status and returns empty AuthResult on failure',
        () async {
      // Arrange
      final user = User(userName: 'test@example.com', password: 'password');
      when(mockAuthUseCase.logIn(user)).thenThrow(Exception());

      // Act
      final result = await logInNotifier.sigIn(user);

      // Assert
      expect(logInNotifier.currentState.status, RequestStatusEnum.failed);
      expect(result, isNotNull);
      expect(
        result,
        isInstanceOf<AuthResult>(),
      ); // Verificar que el resultado sea una instancia de AuthResult
      verify(mockAuthUseCase.logIn(user)).called(1);
    });
  });
}
