import 'package:flutter/material.dart';
import 'package:simple_form_validation/screens/kennel_form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jersey Kennel',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      home: const Padding(
        padding: EdgeInsets.all(40.0),
        child: KennelForm(),
      ),
    );
  }
}
