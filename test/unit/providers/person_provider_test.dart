import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:users_experience_app/src/data/models/address.dart';
import 'package:users_experience_app/src/data/models/models.dart';
import 'package:users_experience_app/src/ui/providers/person_provider.dart';

void main() {
  group('personProvider', () {
    test('initial value should be a Person with default values', () {
      // Arrange
      final container = ProviderContainer();

      // Act
      final person = container.read(personProvider);

      // Assert
      expect(person.name, '');
      expect(person.lastname, '');
      expect(person.birthDate, '');
      expect(person.addresses, [isInstanceOf<Address>()]);
      expect(person.userName, '');
      expect(person.password, '');

      // Dispose the container
      container.dispose();
    });

    test('should update the state with a new Person', () {
      // Arrange
      final container = ProviderContainer();
      final newPerson = Person(
        name: 'John',
        lastname: 'Doe',
        birthDate: '1990-01-01',
        addresses: [
          Address(street: '123 Main St', city: 'City', country: 'Country')
        ],
        userName: 'johndoe',
        password: 'password',
      );

      // Act
      container.read(personProvider.notifier).state = newPerson;
      final person = container.read(personProvider);

      // Assert
      expect(person, newPerson);

      // Dispose the container
      container.dispose();
    });
  });
}
