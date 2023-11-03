import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(final BuildContext context) {
    return const MaterialApp(
      home: ManufacturerCode2Name(),
    );
  }
}

class ManufacturerCode2Name extends StatefulWidget {
  const ManufacturerCode2Name({super.key});

  @override
  State<ManufacturerCode2Name> createState() => _ManufacturerCode2Name();
}

class _ManufacturerCode2Name extends State<ManufacturerCode2Name> {
  String _manufacturerName = '';

  void _updateManufacturerName(final String manufacturerName) {
    setState(() {
      _manufacturerName = manufacturerName;
    });
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
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
    );
  }
}
