import 'package:flutter/material.dart';

class Notif extends StatefulWidget {
  const Notif({super.key});

  @override
  State<Notif> createState() => NotifState();
}

class NotifState extends State<Notif> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notif'),
      ),
      body: Center(
        child: Text('Notif screen'),
      ),
    );
  }
}