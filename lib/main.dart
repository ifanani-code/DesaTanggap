import 'package:flutter/material.dart';
import 'package:homepage/navbar.dart';
import 'package:homepage/login.dart';
import 'package:homepage/page/detail_laporan.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/beranda': (context) => const Home(),
        // '/daftar': (context) => const Daftar(),
        '/detail_laporan': (context) => const DetailLaporan(),
        },
    );
  }
}

