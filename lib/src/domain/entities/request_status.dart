import 'package:users_experience_app/src/domain/enums/enums.dart';

class RequestStatus {
  RequestStatusEnum status;
  String message;

  RequestStatus(
      {this.message = '', this.status = RequestStatusEnum.initialize});
}
