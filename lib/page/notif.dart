import 'package:flutter/material.dart';

class Notif extends StatelessWidget {
  const Notif({super.key});

  @override
  Widget build(BuildContext context) {
    // Contoh data notifikasi
    final List<Map<String, String>> notifications = [
      {
        'image': 'assets/sampah.jpeg', // URL atau path gambar
        'title': 'Laporan Diproses',
        'description':
            'Laporanmu dengan nomor LPR220524001 sedang diproses oleh Bagian Kebersihan.',
        'time': '10:00 WIB'
      },
      {
        'image': 'assets/sampah.jpeg', // URL atau path gambar
        'title': 'Laporan Diproses',
        'description':
            'Laporanmu dengan nomor LPR220524001 sedang diproses oleh Bagian Kebersihan.',
        'time': '10:00 WIB'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Notifikasi', style: TextStyle(fontWeight: FontWeight.bold),),
        // backgroundColor: const Color(0xFF2B2D42),
        // actions: [
        //   IconButton(
        //     icon: const Icon(Icons.more_vert),
        //     onPressed: () {
        //       // Aksi untuk tombol lainnya
        //     },
        //   ),
        // ],
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                padding: const EdgeInsets.all(8.0),
                // decoration: BoxDecoration(
                //   color: Colors.white,
                //   borderRadius: BorderRadius.circular(10),
                //   boxShadow: [
                //     BoxShadow(
                //       color: Colors.grey.withOpacity(0.5),
                //       spreadRadius: 1,
                //       blurRadius: 3,
                //       offset: const Offset(0, 2),
                //     ),
                //   ],
                // ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        notifications[index]['image']!,
                        width: 90 ,
                        height: 90  ,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  notifications[index]['title']!,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Text(notifications[index]['description']!),
                          const SizedBox(height: 5),
                          Text(
                                notifications[index]['time']!,
                                style: const TextStyle(color: Colors.grey),
                              ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                height: 1,
                thickness: 1,
                indent: 16,
                endIndent: 16,
              ),
            ],
          );
        },
      ),
    );
  }
}
