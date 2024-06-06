import 'package:flutter/material.dart';
import 'package:homepage/page/berita.dart';
// import 'package:homepage/page/detail_berita.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:homepage/page/buat_dokumen.dart';
import 'package:homepage/page/kontak_darurat.dart';
import 'package:homepage/page/laporan_masyarakat.dart';

class HPage extends StatefulWidget {
  const HPage({super.key});

  @override
  State<HPage> createState() => _HPageState();
}

class _HPageState extends State<HPage> {
  final List<String> imgList = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSP5DohMzaDXz0upKIWC3eNFi-BMcGh5q57rFw1B1ENopANczP1eu9466_rZKw6m6LMPUs&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQufRbajRi9C7sNHzr22HbTEfwLKjalSusgt0RUcwkNGT002B5vnKunKDi2ZnWgutkRU8k&usqp=CAU',
    'https://kelasanimasi.com/wp-content/uploads/2022/08/pembuka-570x320.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    final Map<String, String> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    final username = arguments['username'];
    final password = arguments['password'];

    if (username == 'fanani' && password == '6701223054') {}

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

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            floating: true,
            automaticallyImplyLeading: false,
            title: Text(
              'Desa Tanggap',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            backgroundColor: Color(0xFFD90429),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 170,
                      color: const Color(0xFFD90429),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 20),
                          child: TextField(
                            decoration: InputDecoration(
                                filled: true,
                                fillColor:
                                    const Color.fromARGB(75, 255, 255, 255),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    borderSide: BorderSide.none),
                                hintText: 'Cari Layanan...',
                                hintStyle:
                                    const TextStyle(color: Colors.white54),
                                suffixIcon: const Icon(
                                  Icons.search,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 20),
                          child: Stack(
                            children: [
                              const SizedBox(
                                height: 50,
                              ),
                              Container(
                                width: double.infinity,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const LaporanMasyarakat()));
                                    },
                                    child: Column(
                                      children: [
                                        const SizedBox(
                                          height: 7.5,
                                        ),
                                        Image.asset(
                                          'assets/Megaphone.png',
                                          width: 39,
                                          height: 39,
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        const SizedBox(
                                          width: 80,
                                          child: Text('Laporan masyarakat',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600)),
                                        )
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const BuatDokumen()));
                                    },
                                    child: Column(
                                      children: [
                                        IconButton(
                                          iconSize: 40,
                                          onPressed: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>const BuatDokumen()));
                                          },
                                          icon: const Icon(
                                              Icons.document_scanner),
                                          color: const Color(0xFFD90429),
                                        ),
                                        const SizedBox(
                                            width: 80,
                                            child: Text('Urus dokumen',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12)))
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const KontakDarurat()));
                                    },
                                    child: Column(
                                      children: [
                                        IconButton(
                                          iconSize: 40,
                                          onPressed: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>const KontakDarurat()));
                                          },
                                          icon: const Icon(Icons.sos),
                                          color: const Color(0xFFD90429),
                                        ),
                                        const SizedBox(
                                            width: 80,
                                            child: Text('Kontak darurat',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12)))
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.symmetric(horizontal: 17),
                  child: CarouselSlider(
                      items: imgList
                          .map((i) => Center(
                                child: Image.network(
                                  i,
                                  height: 150,
                                ),
                              ))
                          .toList(),
                      options: CarouselOptions(
                        initialPage: 0,
                        height: 150,
                        autoPlay: true,
                      )),
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(17, 34, 17, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Berita',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Poppins'),
                          textAlign: TextAlign.left,
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          BeritaListScreen()));
                            },
                            child: Text(
                              'Lainnya',
                              style: TextStyle(
                                  fontSize: 15, color: Colors.grey.shade700),
                            ))
                      ],
                    )),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 350,
                        child: ListView.builder(
                          itemCount: 2,
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
                                          padding: const EdgeInsets.fromLTRB(
                                              10, 10, 0, 10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
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
                                SizedBox(height: 10,)
                              ],
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 10,),
                    ],
                  ),
                ),
              ],
            ),
          ]))
        ],
      ),
    );
  }
}
