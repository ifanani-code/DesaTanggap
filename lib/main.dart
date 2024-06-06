import 'package:flutter/material.dart';
import 'package:homepage/navbar.dart';
import 'package:homepage/login.dart';
import 'package:homepage/page/detail_laporan.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
      routes: {
        '/login': (context) => LoginScreen(),
        '/beranda': (context) => const Home(),
        // '/daftar': (context) => const Daftar(),
        '/detail_laporan': (context) => const DetailLaporan(),
        },
    );
  }
}

