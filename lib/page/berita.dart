import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BeritaListScreen extends StatelessWidget {
  final List<Map<String, String>> beritaList = [
    {
      'kategori': 'UMKM',
      'waktu': '3 menit',
      'judul': 'Judul 1',
      'deskripsi': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      'imagePath': 'assets/sampah.jpeg',
    },
    {
      'kategori': 'UMKM',
      'waktu': '5 menit',
      'judul': 'Judul 2',
      'deskripsi': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      'imagePath': 'assets/sampah.jpeg',
    },
    {
      'kategori': 'UMKM',
      'waktu': '10 menit',
      'judul': 'Judul 3',
      'deskripsi': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      'imagePath': 'assets/sampah.jpeg',
    },
    {
      'kategori': 'UMKM',
      'waktu': '10 menit',
      'judul': 'Judul 4',
      'deskripsi': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      'imagePath': 'assets/sampah.jpeg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        titleSpacing: 0,
        title: const Text(
          'Berita',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromRGBO(217, 217, 217, 0.5),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide.none,
                ),
                hintText: 'Cari Laporan...',
                hintStyle: const TextStyle(
                  color: Color.fromRGBO(168, 168, 168, 1),
                  fontWeight: FontWeight.normal,
                ),
                suffixIcon: const Icon(
                  Icons.search,
                  color: Color.fromRGBO(168, 168, 168, 1),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: beritaList.length,
                itemBuilder: (context, index) {
                  final berita = beritaList[index];
                  return 
                  Column(
                    children: [
                      Card(
                        elevation: 3,
                        color: Colors.white,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailBerita(
                                  judul: berita['judul']!,
                                  deskripsi: berita['deskripsi']!,
                                  imagePath: berita['imagePath']!,
                                ),
                              ),
                            );
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  berita['imagePath']!,
                                  height: 150,
                                  width: 130,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          berita['kategori']!,
                                          style: TextStyle(
                                              color: Colors.grey[700],
                                              fontSize: 12),
                                        ),
                                        const SizedBox(
                                          width: 70,
                                        ),
                                        Text(
                                          berita['waktu']!,
                                          style: TextStyle(
                                              color: Colors.grey[700],
                                              fontSize: 12),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        const Icon(
                                          Icons.access_time_filled,
                                          color: Colors.grey,
                                          size: 17,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      berita['judul']!,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17),
                                      textAlign: TextAlign.start,
                                    ),
                                    const SizedBox(height: 20),
                                    SizedBox(
                                      width: 167,
                                      child: Text(
                                        berita['deskripsi']!,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w500),
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10,)
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 15,)
          ],
        ),
      ),
    );
  }
}

class DetailBerita extends StatelessWidget {
  final String judul;
  final String deskripsi;
  final String imagePath;

  const DetailBerita({
    Key? key,
    required this.judul,
    required this.deskripsi,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        titleSpacing: 0,
        title: Text(judul, style: const TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18
        ),),
        backgroundColor: const Color(0xFFD90429),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              judul,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              deskripsi,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
