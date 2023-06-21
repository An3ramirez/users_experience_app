import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:users_experience_app/src/ui/global_widgets/custom_app_bar.dart';
import 'package:users_experience_app/src/ui/providers/person_provider.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final person = ref.watch(personProvider);

    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(title: 'Perfil'),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Name: ${person.name}',
                style: const TextStyle(
                    fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              Text(
                'Lastname: ${person.lastname}',
                style: const TextStyle(
                    fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              Text(
                'Fecha Nacimiento: ${person.birthDate}',
                style: const TextStyle(
                    fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              Text(
                'Nombre Usuario: ${person.userName}',
                style: const TextStyle(
                    fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Direcciones: ',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              Container(
                color: Colors.amber[50],
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: person.addresses.length,
                  itemBuilder: (context, index) {
                    final address = person.addresses[index];
                    return ListTile(
                      title: Text('Dirección ${index + 1}'),
                      subtitle: Text(
                          'Dirección: ${address.street}, Cuidad: ${address.city}, Pais: ${address.country}'),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
