import 'package:flutter/material.dart';

class Lapor extends StatefulWidget {
  const Lapor({super.key});

  @override
  State<Lapor> createState() => _LaporState();
}

class _LaporState extends State<Lapor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lapor'),
      ),
    );
  }
}