import 'package:users_experience_app/src/data/models/address.dart';
import 'package:users_experience_app/src/data/models/models.dart';

class Person extends User {
  final String name, lastname, birthDate;
  final List<Address> addresses;

  Person({
    required this.name,
    required this.lastname,
    required this.birthDate,
    required this.addresses,
    required super.userName,
    required super.password,
  });
}

Person emptyPerson() => Person(
      name: '',
      lastname: '',
      birthDate: '',
      addresses: [],
      password: '',
      userName: '',
    );
