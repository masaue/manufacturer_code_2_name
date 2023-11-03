import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: SizedBox(
        width: 100,
        child: TextField(
          autofocus: true,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(3),
          ],
          keyboardType: TextInputType.number,
          style: const TextStyle(fontSize: 42),
          textAlign: TextAlign.center,
        ),
      ),
    ));
  }
}
