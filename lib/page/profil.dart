import 'package:flutter/material.dart';
import 'package:homepage/page/data_diri.dart';
import 'package:homepage/services/shared_service.dart';
import 'dart:convert';

class Akun extends StatefulWidget {
  const Akun({super.key});

  @override
  State<Akun> createState() => _AkunState();
}

class _AkunState extends State<Akun> {
  late Map<String, dynamic> userProfileData = {}; // Mengubah tipe data userProfileData

  @override
  void initState() {
    super.initState();
    getUserProfileData();
  }

  void getUserProfileData() async {
    var loginDetails = await SharedService.loginDetails();
    var token = loginDetails?.token;

    if (token != null) {
      var profileData = await SharedService.getUserProfile(token);
      print(profileData);
      setState(() {
        userProfileData = json.decode(profileData); // Mengubah string menjadi Map
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Container(
        color: const Color(0xFFEDF2F4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: Color(0xFFD90429),
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userProfileData.isNotEmpty ? userProfileData['data'][0]['fullName'] : '',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        // ignore: prefer_interpolation_to_compose_strings
                        '@' + (userProfileData.isNotEmpty ? userProfileData['data'][0]['username'] : ''),
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.black),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DataDiri()));
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.settings, color: Colors.black),
                    title: const Text('Pengaturan'),
                    onTap: () {
                      // Aksi untuk tombol Pengaturan
                    },
                  ),
                  const Divider(
                    thickness: 0.5,
                  ),
                  ListTile(
                    leading: const Icon(Icons.info, color: Colors.black),
                    title: const Text('Tentang Aplikasi'),
                    onTap: () {
                      // Aksi untuk tombol Tentang Aplikasi
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
                color: Colors.white,
                child: Column(children: [
                  ListTile(
                    leading:
                        const Icon(Icons.exit_to_app, color: Color(0xFFD90429)),
                    title: const Text('Keluar',
                        style: TextStyle(color: Color(0xFFD90429))),
                    onTap: () {
                      SharedService.logout(context);
                    },
                  ),
                ]))
          ],
        ),
      ),
    );
  }
}