import 'package:flutter/material.dart';
import 'package:users_experience_app/src/data/models/address.dart';

class ListAddress extends StatelessWidget {
  final Address address;
  final int index;

  const ListAddress({Key? key, required this.address, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Dirreccion ${index + 1}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(child: Text('Direccion: ${address.street}')),
              Expanded(child: Text('Cuidad: ${address.city}')),
            ],
          ),
          const SizedBox(height: 5.0),
          Row(
            children: [
              Text('Pais: ${address.country}'),
            ],
          )
        ],
      ),
    );
  }
}
