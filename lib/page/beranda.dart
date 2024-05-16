import 'package:flutter/material.dart';
import 'package:homepage/page/detail_berita.dart';

class HPage extends StatefulWidget {
  const HPage({super.key});

  @override
  State<HPage> createState() => _HPageState();
}

class _HPageState extends State<HPage> {
  @override
  Widget build(BuildContext context) {
    final Map<String, String> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    final username = arguments['username'];
    final password = arguments['password'];

    if (username == 'fanani' && password == '6701223054') {}

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Desa Tanggap',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFFD90429),
      ),
      body: SingleChildScrollView(
        child: Column(
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
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            hintText: 'Cari Layanan...',
                            hintStyle: TextStyle(color: Colors.white),
                            suffixIcon: Icon(
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
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  IconButton(
                                    iconSize: 30,
                                    onPressed: () {},
                                    icon: const Icon(Icons.report_problem),
                                    color: const Color(0xFFD90429),
                                  ),
                                  const SizedBox(
                                    width: 80,
                                    child: Text('Laporan masyarakat',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.black,
                                        )),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  IconButton(
                                    iconSize: 30,
                                    onPressed: () {},
                                    icon: const Icon(Icons.document_scanner),
                                    color: const Color(0xFFD90429),
                                  ),
                                  const SizedBox(
                                      width: 80,
                                      child: Text('Urus dokumen',
                                          textAlign: TextAlign.center,
                                          style:
                                              TextStyle(color: Colors.black)))
                                ],
                              ),
                              Column(
                                children: [
                                  IconButton(
                                    iconSize: 30,
                                    onPressed: () {},
                                    icon: const Icon(Icons.sos),
                                    color: const Color(0xFFD90429),
                                  ),
                                  const SizedBox(
                                      width: 80,
                                      child: Text('Kontak darurat',
                                          textAlign: TextAlign.center,
                                          style:
                                              TextStyle(color: Colors.black)))
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 17),
              child: Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQsu3YDDDuaHFQ_zHtGxcf4GnaUdwQKIqkdYxPeDNihxw&s'),
                    fit: BoxFit
                        .cover, // Atur agar gambar menutupi seluruh area container
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 17, vertical: 12),
                child: Text(
                  'Berita',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins'),
                  textAlign: TextAlign.left,
                )),
            Card(
                color: Colors.white,
                margin: const EdgeInsets.fromLTRB(17, 10, 17, 20),
                child: InkWell(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DetailBerita())),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/umkm.jpeg',
                          height: 150,
                          width: 130,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'UMKM',
                                  style: TextStyle(
                                      color: Colors.grey[700], fontSize: 12),
                                ),
                                const SizedBox(
                                  width: 70,
                                ),
                                Text('3menit',
                                    style: TextStyle(
                                        color: Colors.grey[700], fontSize: 12)),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Icon(
                                  Icons.access_time_filled,
                                  color: Colors.grey,
                                  size: 17,
                                )
                              ],
                            ),
                            const Text(
                              'Judul',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                              textAlign: TextAlign.start,
                            ),
                            const SizedBox(
                              height: 35,
                            ),
                            const SizedBox(
                              width: 167,
                              child: Text(
                                'lorem ipsum dolor sit amet',
                                style: TextStyle(fontWeight: FontWeight.w500),
                                textAlign: TextAlign.start,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )),
            Card(
              color: Colors.white,
              margin: const EdgeInsets.fromLTRB(17, 10, 17, 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/umkm.jpeg',
                      height: 150,
                      width: 130,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'UMKM',
                              style: TextStyle(
                                  color: Colors.grey[700], fontSize: 12),
                            ),
                            const SizedBox(
                              width: 70,
                            ),
                            Text('3menit',
                                style: TextStyle(
                                    color: Colors.grey[700], fontSize: 12)),
                            const SizedBox(
                              width: 5,
                            ),
                            const Icon(
                              Icons.access_time_filled,
                              color: Colors.grey,
                              size: 17,
                            )
                          ],
                        ),
                        const Text(
                          'Judul',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                          textAlign: TextAlign.start,
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        const SizedBox(
                          width: 167,
                          child: Text(
                            'lorem ipsum dolor sit amet',
                            style: TextStyle(fontWeight: FontWeight.w500),
                            textAlign: TextAlign.start,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Card(
              color: Colors.white,
              margin: const EdgeInsets.fromLTRB(17, 10, 17, 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/umkm.jpeg',
                      height: 150,
                      width: 130,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'UMKM',
                              style: TextStyle(
                                  color: Colors.grey[700], fontSize: 12),
                            ),
                            const SizedBox(
                              width: 70,
                            ),
                            Text('3menit',
                                style: TextStyle(
                                    color: Colors.grey[700], fontSize: 12)),
                            const SizedBox(
                              width: 5,
                            ),
                            const Icon(
                              Icons.access_time_filled,
                              color: Colors.grey,
                              size: 17,
                            )
                          ],
                        ),
                        const Text(
                          'Judul',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                          textAlign: TextAlign.start,
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        const SizedBox(
                          width: 167,
                          child: Text(
                            'lorem ipsum dolor sit amet',
                            style: TextStyle(fontWeight: FontWeight.w500),
                            textAlign: TextAlign.start,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
