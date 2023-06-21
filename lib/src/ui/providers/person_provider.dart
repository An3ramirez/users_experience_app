import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:users_experience_app/src/data/models/address.dart';
import 'package:users_experience_app/src/data/models/models.dart';

final personProvider = StateProvider<Person>(
  (ref) => Person(
    name: '',
    lastname: '',
    birthDate: '',
    addresses: [Address(street: '', city: '', country: '')],
    userName: '',
    password: '',
  ),
);
