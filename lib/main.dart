import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_provider/Provider/counter_provider.dart';
import 'package:todo_provider/Provider/imagepicker_provider.dart';
import 'package:todo_provider/Provider/todo_provider.dart';
import 'package:todo_provider/view/Counter/counter_screen.dart';
import 'package:todo_provider/view/image_upload/image_upload.dart';
import 'package:todo_provider/view/screen/home_screen.dart';

void main() {
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
      home: ImagePickerScreen(),
    );
  }
}
