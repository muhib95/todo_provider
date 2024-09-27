import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_provider/Provider/counter_provider.dart';
import 'package:todo_provider/Provider/imagepicker_provider.dart';
import 'package:todo_provider/Provider/todo_provider.dart';
import 'package:todo_provider/view/hive_screen.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Box box = await Hive.openBox('country-list');
  box.put('country', 'Bangladesh');
  box.put('country', 'India');
  print('From hive: ${box.get('country')}');
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => TodoProvider()),
      ChangeNotifierProvider(
        create: (context) => CounterProvider(),
      ),
      ChangeNotifierProvider(create: (_) => ImagePickerProvider()),
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HiveScreen(),
    );
  }
}
