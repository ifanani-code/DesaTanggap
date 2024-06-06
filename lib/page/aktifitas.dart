import 'package:flutter/material.dart';
import 'buat_dokumen.dart';
// import 'laporan_masyarakat.dart';

class Aktivitas extends StatelessWidget {
  const Aktivitas({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Jumlah tab yang kita miliki
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            'Aktifitas',
            style: TextStyle(
              color: Color(0xFFD90429),
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.white,
          bottom: const TabBar(
            labelColor: Colors.black,
            labelStyle: TextStyle(fontWeight: FontWeight.w600),
            unselectedLabelColor: Colors.grey,
            indicatorColor: Color(0xFFD90429),
            tabs: [
              Tab(text: 'Laporan Saya'),
              Tab(text: 'Dokumen Saya'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            LaporanSaya(),
            DokumenSaya(),
          ],
        ),
      ),
    );

    //
  }
}

class LaporanSaya extends StatelessWidget {
  const LaporanSaya({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Card 1
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/detail_laporan');
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        margin: const EdgeInsets.fromLTRB(17, 10, 17, 5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(
                                    "assets/sampah.jpeg",
                                    width: 130,
                                    height: 120, // Adjust the height as needed
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: Color.fromRGBO(168, 168, 168, 1),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(15),
                                        bottomRight: Radius.circular(15),
                                      ),
                                    ),
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    child: const Text(
                                      'Menunggu',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: const Color.fromRGBO(
                                                43, 45, 66, 1),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 8,
                                            vertical: 4,
                                          ),
                                          child: const Text(
                                            'Kebersihan',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                        const Text(
                                          'RT 5',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    const Text(
                                      'Sampah menumpuk di RT 5',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    const Text(
                                      '20 menit',
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // End Card 1
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DokumenSaya extends StatelessWidget {
  const DokumenSaya({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 50,
          ),
          Image.asset(
            'assets/dokumen.png',
            height: 162,
            width: 235,
          ),
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
            width: 275,
            child: Text(
              'Tidak ada pengurusan dokumen saat ini',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const SizedBox(
            width: 250,
            child: Text(
              'Ingin mengurus dokumen? silahkan masuk ke halaman urus dokumen.',
              style: TextStyle(fontSize: 14, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ),

          SizedBox(height: 10,),

          ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>BuatDokumen()));

              },
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Color(0xFFD90429)),
                minimumSize: MaterialStatePropertyAll(Size(109, 35)),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)))
              ),
              child: const Text('Urus Dokumen',
                  style: TextStyle(
                    color: Colors.white,
                  )))
        ],
      ),
    );
  }
}
