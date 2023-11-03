import 'dart:convert';

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
  List _manufacturers = [];
  String _manufacturerName = '';

  Future<void> _readJson() async {
    final String response =
        await rootBundle.loadString('assets/manufacturers.json');
    final data = await json.decode(response);

    setState(() {
      _manufacturers = data["manufacturers"];
    });
  }

  void _updateManufacturerName(final String manufacturerName) {
    setState(() {
      _manufacturerName = manufacturerName;
    });
  }

  @override
  Widget build(final BuildContext context) {
    String manufacturerName = 'Unknown';

    return Scaffold(
        body: Column(children: <Widget>[
      SizedBox(
        width: 100,
        child: TextField(
          autofocus: true,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(3),
          ],
          keyboardType: TextInputType.number,
          onChanged: (final text) => {
            if (text.length == 3)
              {
                manufacturerName = _manufacturers.firstWhere(
                    (manufacturer) => manufacturer['code'] == text,
                    orElse: () => {'name': 'Unknown'})['name'],
                _updateManufacturerName(manufacturerName)
              }
            else
              {_updateManufacturerName('')}
          },
          style: const TextStyle(fontSize: 42),
          textAlign: TextAlign.center,
        ),
      ),
      Text(_manufacturerName, style: const TextStyle(fontSize: 42))
    ]));
  }

  @override
  void initState() {
    super.initState();
    _readJson();
  }
}
