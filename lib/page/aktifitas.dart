import 'package:flutter/material.dart';

class Aktifitas extends StatefulWidget {
  const Aktifitas({super.key});

  @override
  State<Aktifitas> createState() => _AktifitasState();
}

class _AktifitasState extends State<Aktifitas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aktivitas'),
      ),
      body: Center(
        child: Text('Aktifitas screen'),
      ),
    );
  }
}