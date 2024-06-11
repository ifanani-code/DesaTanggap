import 'package:flutter/material.dart';
import 'package:homepage/navbar.dart';
import 'package:homepage/login.dart';
import 'package:homepage/page/detail_laporan.dart';
import 'package:homepage/services/shared_service.dart';

Widget defalutHome = const LoginScreen();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  bool result = await SharedService.isLoggedIn();
  if (result) {
    defalutHome = const Home();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: const LoginScreen(),
      routes: {
        '/': (context) => defalutHome,
        '/login': (context) => const LoginScreen(),
        '/beranda': (context) => const Home(),
        // '/daftar': (context) => const Daftar(),
        '/detail_laporan': (context) => const DetailLaporan(),
      },
    );
  }
}
