import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:users_experience_app/src/routes/routes.dart';
import 'package:users_experience_app/src/ui/global_widgets/custom_app_bar.dart';
import 'package:users_experience_app/src/ui/providers/person_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final personData = ref.watch(personProvider);

    return Scaffold(
        appBar: const CustomAppBar(title: 'Home'),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text(
                  'Hola ${personData.name}',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                const Text(
                    'Puede tocar el ícono de ajustes en la esquina superior derecha para ver su perfil.')
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamedAndRemoveUntil(
            context,
            Routes.WELCOME,
            (_) => false,
          ),
          child: const Icon(Icons.logout),
        ));
  }
}
