import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:homepage/page/aktifitas.dart';
import 'package:homepage/page/lapor.dart';
// import 'package:homepage/page/lapor.dart';
import 'package:homepage/page/profil.dart';
import 'package:homepage/page/beranda.dart';
import 'package:homepage/page/notif.dart';
import 'package:image_picker/image_picker.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  File? _selectedImage;

  int currentTab = 0;
  final List<Widget> screens = [
    const HPage(),
    const Aktifitas(),
    const Notif(),
    const Akun()
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const HPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(bucket: bucket, child: currentScreen),
      floatingActionButton: FloatingActionButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          foregroundColor: Colors.white,
          backgroundColor: const Color(0xFFD90429),
          child: const Icon(Icons.camera_alt),
          onPressed: () {
            showModalBottomSheet(
                shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(32))),
                context: context,
                builder: (BuildContext context) => SizedBox(
                      height: 200,
                      width: double.infinity,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Lapor',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  onPressed: () => _pickImageFromGallery(),
                                  style: const ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          Color(0xFF2B2D42)),
                                      foregroundColor: MaterialStatePropertyAll(
                                          Colors.white)),
                                  child: const Text('Unggah foto'),
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                                ElevatedButton(
                                    onPressed: () => _pickImageFromCamera(),
                                    style: const ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Color(0xFFD90429)),
                                        foregroundColor:
                                            MaterialStatePropertyAll(
                                                Colors.white)),
                                    child: const Text('Ambil foto'))
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            _selectedImage != null
                                ? Image.file(_selectedImage!)
                                : const Text('')
                          ],
                        ),
                      ),
                    ));
            // Navigator.push(context, MaterialPageRoute(builder: (context)=>const Lapor()));
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xFF2B2D42),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        shape: const CircularNotchedRectangle(),
        notchMargin: 0.1,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 20,
                    onPressed: () {
                      setState(() {
                        currentScreen = const HPage();
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home,
                          color: currentTab == 0
                              ? const Color(0xFFD90429)
                              : Colors.white,
                        ),
                        Text('Beranda',
                            style: TextStyle(
                                color: currentTab == 0
                                    ? const Color(0xFFD90429)
                                    : Colors.white))
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 20,
                    onPressed: () {
                      setState(() {
                        currentScreen = const Aktifitas();
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.newspaper,
                          color: currentTab == 1
                              ? const Color(0xFFD90429)
                              : Colors.white,
                        ),
                        Text('Aktivitas',
                            style: TextStyle(
                                color: currentTab == 1
                                    ? const Color(0xFFD90429)
                                    : Colors.white))
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 20,
                    onPressed: () {
                      setState(() {
                        currentScreen = const Notif();
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.notifications,
                          color: currentTab == 2
                              ? const Color(0xFFD90429)
                              : Colors.white,
                        ),
                        Text('Notifikasi',
                            style: TextStyle(
                                color: currentTab == 2
                                    ? const Color(0xFFD90429)
                                    : Colors.white))
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 20,
                    onPressed: () {
                      setState(() {
                        currentScreen = const Akun();
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person,
                          color: currentTab == 3
                              ? const Color(0xFFD90429)
                              : Colors.white,
                        ),
                        Text('Profil',
                            style: TextStyle(
                                color: currentTab == 3
                                    ? const Color(0xFFD90429)
                                    : Colors.white))
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future _pickImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (returnedImage == null) return;
    setState(() {
      _selectedImage = File(returnedImage.path);
    });

    Navigator.pop(context);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Lapor(image: _selectedImage!),
      ),
    ).then((_) => setState(() {
      _selectedImage = null;
    }));
  }

  Future _pickImageFromCamera() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (returnedImage == null) return;
    setState(() {
      _selectedImage = File(returnedImage.path);
    });

    Navigator.pop(context);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Lapor(image: _selectedImage!),
      ),
    ).then((_) => setState(() {
      _selectedImage = null;
    }));
  }
}
