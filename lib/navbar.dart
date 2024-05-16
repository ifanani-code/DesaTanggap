import 'package:flutter/material.dart';
import 'package:homepage/page/aktifitas.dart';
import 'package:homepage/page/lapor.dart';
import 'package:homepage/page/profil.dart';
import 'package:homepage/page/beranda.dart';
import 'package:homepage/page/notif.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xFFD90429),
        child: const Icon(Icons.camera_alt),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>const Lapor()));
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
                      onPressed: (){
                        setState(() {
                          currentScreen = const HPage();
                          currentTab= 0;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.home,
                            color: currentTab == 0 ? const Color(0xFFD90429):Colors.white,
                          ),
                          Text(
                            'Beranda',
                            style: TextStyle(color: currentTab == 0 ? const Color(0xFFD90429):Colors.white)
                            )
                        ],
                      ),
                    ),

                    MaterialButton(
                      minWidth: 20,
                      onPressed: (){
                        setState(() {
                          currentScreen = const Aktifitas();
                          currentTab= 1;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.newspaper,
                            color: currentTab == 1 ? const Color(0xFFD90429):Colors.white,
                          ),
                          Text(
                            'Aktivitas',
                            style: TextStyle(color: currentTab == 1 ? const Color(0xFFD90429):Colors.white)
                            )
                        ],
                      ),
                    ),

                    MaterialButton(
                      minWidth: 20,
                      onPressed: (){
                        setState(() {
                          currentScreen = const Notif();
                          currentTab= 2;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.notifications,
                            color: currentTab == 2 ? const Color(0xFFD90429):Colors.white,
                          ),
                          Text(
                            'Notifikasi',
                            style: TextStyle(color: currentTab == 2 ? const Color(0xFFD90429):Colors.white)
                            )
                        ],
                      ),
                    ),

                    MaterialButton(
                      minWidth: 20,
                      onPressed: (){
                        setState(() {
                          currentScreen = const Akun();
                          currentTab= 3;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.person,
                            color: currentTab == 3 ? const Color(0xFFD90429):Colors.white,
                          ),
                          Text(
                            'Profil',
                            style: TextStyle(color: currentTab == 3 ? const Color(0xFFD90429):Colors.white)
                            )
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
}