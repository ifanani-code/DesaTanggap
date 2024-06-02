import 'package:flutter/material.dart';

class KontakDarurat extends StatelessWidget {
  const KontakDarurat({super.key});

  @override
  Widget build(BuildContext context) {
    // Daftar kontak darurat dengan path gambar
    final List<Map<String, dynamic>> emergencyContacts = [
      {
        'image': 'assets/Police.png',
        'title': 'Polisi',
      },
      {
        'image': 'assets/Binoculars.png',
        'title': 'Tim SAR (Search and Rescue)',
      },
      {
        'image': 'assets/Medical Sign Board.png',
        'title': 'Palang Merah Indonesia',
      },
      {
        'image': 'assets/Tent.png',
        'title': 'Posko Bencana Alam',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Kontak Darurat',
          style: TextStyle(
              color: Color(0xFFD90429), fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 30, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Pilih nomor darurat yang anda butuhkan',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: emergencyContacts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      radius: 22.5,
                      backgroundColor: const Color(0xFFEDF2F4),
                      child: Image.asset(
                        emergencyContacts[index]['image'],
                        fit: BoxFit.cover,
                        width: 35,
                        height: 35,
                      ),
                    ),
                    title: Text(
                      emergencyContacts[index]['title'],
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: KontakDarurat(),
  ));
}
