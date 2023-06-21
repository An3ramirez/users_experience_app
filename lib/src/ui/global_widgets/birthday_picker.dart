import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:users_experience_app/src/domain/constants/constants.dart';

class BirthdayPicker extends StatefulWidget {
  final Function(String) onDateSelected;

  const BirthdayPicker({super.key, required this.onDateSelected});

  @override
  BirthdayPickerState createState() => BirthdayPickerState();
}

class BirthdayPickerState extends State<BirthdayPicker> {
  late DateTime _selectedDate;
  late TextEditingController _dateController;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    _dateController = TextEditingController();
    _dateController.text = DateFormat('dd/MM/yyyy').format(_selectedDate);
    widget.onDateSelected(_dateController.text);
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  void _showDatePicker(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext builder) {
        return SizedBox(
          height: 300.0,
          child: CupertinoTheme(
            data: const CupertinoThemeData(brightness: Brightness.dark),
            child: CupertinoDatePicker(
              backgroundColor: primaryColor,
              mode: CupertinoDatePickerMode.date,
              initialDateTime: _selectedDate,
              onDateTimeChanged: (DateTime newDate) {
                setState(() {
                  _selectedDate = newDate;
                  _dateController.text =
                      DateFormat('dd/MM/yyyy').format(_selectedDate);
                });
                widget.onDateSelected(_dateController.text);
              },
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: marginBottonCustomInputs),
      child: GestureDetector(
        onTap: () {
          _showDatePicker(context);
        },
        child: AbsorbPointer(
          child: TextFormField(
            style: const TextStyle(color: Colors.white),
            controller: _dateController,
            decoration: const InputDecoration(
              labelText: 'Fecha de nacimiento',
              labelStyle: TextStyle(fontSize: 20, color: textInputColor),
              suffixIcon: Icon(CupertinoIcons.calendar, color: textInputColor),
            ),
          ),
        ),
      ),
    );
  }
}
