import 'package:deliveryproyect/src/helpers/dependency_injection.dart';
import 'package:deliveryproyect/src/my_app.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DependencyInjection.initialize();
  runApp(const MyApp());
}
