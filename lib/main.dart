import 'package:flutter/material.dart';
import 'package:so_boleto/app_widget.dart';
import 'package:so_boleto/injection_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await InjectionService.init();
  runApp(const AppWidget());
}
