import 'package:flutter/material.dart';
import 'package:optovka/app/app.dart';
import 'app/inject/app_module.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();

  runApp(const App());
}
