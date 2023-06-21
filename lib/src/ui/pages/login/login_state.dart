import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:users_experience_app/src/domain/entities/requestStatus.dart';
import 'package:users_experience_app/src/domain/enums/enum_request_status.dart';

import 'package:users_experience_app/src/data/models/models.dart';
import 'package:users_experience_app/src/domain/entities/auth_result.dart';
import 'package:users_experience_app/src/domain/usecases/auth_use_case.dart';

class LogInNotifier extends StateNotifier<RequestStatus> {
  final AuthUseCase _authUseCase;

  LogInNotifier(this._authUseCase) : super(RequestStatus());

  Future<AuthResult> sigIn(User user) async {
    try {
      state.status = RequestStatusEnum.loading;
      var auth = await _authUseCase.signIn(user);
      state.status =
          auth.status ? RequestStatusEnum.success : RequestStatusEnum.failed;
      return auth;
    } catch (e) {
      state.status = RequestStatusEnum.failed;
      return AuthResult();
    }
  }

  void logout() {
    print('logout');
  }

  void saveToken(String token) {
    print('saved token');
  }
}

final StateNotifierProvider<LogInNotifier, RequestStatus> logInStateProvider =
    StateNotifierProvider((ref) {
  var authUseCase = ref.watch(authUseCaseProvider);
  return LogInNotifier(authUseCase);
});
