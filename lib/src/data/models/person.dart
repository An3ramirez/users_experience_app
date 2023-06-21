import 'package:users_experience_app/src/data/models/models.dart';

class Person extends User {
  final String name, lastname, birthDate, address;

  Person({
    required this.name,
    required this.lastname,
    required this.birthDate,
    required this.address,
    required super.userName,
    required super.password,
  });
}

Person emptyPerson() => Person(
      name: '',
      lastname: '',
      birthDate: '',
      address: '',
      password: '',
      userName: '',
    );
