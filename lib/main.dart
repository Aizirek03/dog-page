import 'package:dogpage/ui/dog_page.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dog API',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const DogPage(),
    );
  }
}