import 'package:flutter/material.dart';
import 'package:homepage/page/data_diri.dart';

class Akun extends StatefulWidget {
  const Akun({super.key});

  @override
  State<Akun> createState() => _AkunState();
}

class _AkunState extends State<Akun> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // elevation: 0,
        // backgroundColor: Colors.white,
        // iconTheme: const IconThemeData(color: Colors.black),
        // actions: [
        //   IconButton(
        //     icon: const Icon(Icons.more_vert),
        //     onPressed: () {
        //       // Aksi untuk tombol lainnya
        //     },
        //   ),
        // ],
      ),
      body: Container(
        color: Color(0xFFEDF2F4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.white, // Warna putih untuk row profile avatar
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
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Azizi Asadel',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '@zee',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.black),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const DataDiri()));
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              color: Colors.white, // Warna putih untuk list tile
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.settings, color: Colors.black),
                    title: const Text('Pengaturan'),
                    onTap: () {
                      // Aksi untuk tombol Pengaturan
                    },
                  ),
                  const Divider(thickness: 0.5,),
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
                  SizedBox(
                    height: 15,
                  ),
            Container(
                color: Colors.white, // Warna putih untuk list tile
                child: Column(children: [
                  ListTile(
                    leading: const Icon(Icons.exit_to_app, color: Color(0xFFD90429)),
                    title: const Text('Keluar',
                        style: TextStyle(color: Color(0xFFD90429))),
                    onTap: () {
                      // Aksi untuk tombol Keluar
                    },
                  ),
                ]))
          ],
        ),
      ),
    );
  }
}
