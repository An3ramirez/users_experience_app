import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:users_experience_app/src/users_experience_app.dart';

void main() {
  runApp(const ProviderScope(child: UserExperienceApp()));
}
