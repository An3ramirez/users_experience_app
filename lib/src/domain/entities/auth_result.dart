class AuthResult {
  final String message, aditionalData;
  bool status;

  AuthResult({this.message = '', this.status = false, this.aditionalData = ''});
}
