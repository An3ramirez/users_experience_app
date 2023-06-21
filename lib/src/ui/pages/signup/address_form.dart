import 'package:flutter/material.dart';
import 'package:users_experience_app/src/data/models/address.dart';

class AddressForm extends StatefulWidget {
  final Function(Address) onSubmit;

  const AddressForm({Key? key, required this.onSubmit}) : super(key: key);

  @override
  AddressFormState createState() => AddressFormState();
}

class AddressFormState extends State<AddressForm> {
  final _formKey = GlobalKey<FormState>();
  final _streetController = TextEditingController();
  final _cityController = TextEditingController();
  final _countryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: _streetController,
            decoration: const InputDecoration(labelText: 'Dirección'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingrese la dirección';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _cityController,
            decoration: const InputDecoration(labelText: 'Cuidad'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingrese la ciudad';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _countryController,
            decoration: const InputDecoration(labelText: 'Pais'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingrese el pais';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  bool submitForm() {
    if (_formKey.currentState?.validate() == true) {
      final address = Address(
        street: _streetController.text,
        city: _cityController.text,
        country: _countryController.text,
      );

      widget.onSubmit(address);
      _clearForm();
      return true;
    }
    return false;
  }

  void _clearForm() {
    _streetController.clear();
    _cityController.clear();
    _countryController.clear();
  }
}
