class User {
  final String userName, password;

  User({
    required this.userName,
    required this.password,
  });
}

User emptyUser() => User(
      userName: '',
      password: '',
    );
