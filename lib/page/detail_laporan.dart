import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class DetailLaporan extends StatelessWidget {
  const DetailLaporan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: const Text(
          'Detail Laporan',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        backgroundColor: const Color(0xFFD90429),
        iconTheme: const IconThemeData(
          color: Colors.white, // Warna baru untuk ikon back button
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  child: Image.asset(
                    "assets/sampah.jpeg",
                    width: double.infinity,
                    height: 250, // Adjust the height as needed
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            // STATUS LAPORAN
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: const Color.fromRGBO(167, 167, 167, 1),
                    width: 1, // Border width
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // Kolom untuk 'Nomor Laporan'
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Nomor Laporan',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromRGBO(167, 167, 167, 1),
                                fontSize: 12),
                          ),
                          SizedBox(
                              height: 8), // Add space between title and content
                          SelectableText(
                            'LPR220524001',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      // Vertical Divider
                      const VerticalDivider(
                        color: Color.fromRGBO(
                            167, 167, 167, 1), // Adjust the color as needed
                        thickness: 1, // Adjust the thickness as needed
                        indent: 20, // Adjust the top spacing as needed
                        endIndent: 20, // Adjust the bottom spacing as needed
                      ),
                      // Kolom untuk 'Status Laporan'
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Status Laporan',
                            style: TextStyle(
                                color: Color.fromRGBO(167, 167, 167, 1),
                                fontSize: 12),
                          ),
                          const SizedBox(
                              height: 8), // Add space between title and content
                          Container(
                            padding: const EdgeInsets.all(
                                4), // Add padding around the text
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(168, 168, 168, 1),
                              borderRadius: BorderRadius.circular(
                                  4), // Optional: if you want rounded corners
                            ),
                            child: const Text(
                              'Menunggu',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // END STATUS LAPORAN
            // DESKRIPSI MASALAH SECTION
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: const Color.fromRGBO(167, 167, 167, 1),
                    width: 1, // Border width
                  ),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Deskripsi Masalah',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 4), // Space between title and content
                    Text(
                      'Sampah menumpuk di area taman bermain.',
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(height: 25), // Space between sections
                    Text(
                      'Kategori Masalah',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 4), // Space between title and content
                    Text(
                      'Kebersihan',
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(height: 25), // Space between sections
                    Text(
                      'Lokasi Masalah',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 4), // Space between title and content
                    Text(
                      'Taman Bermain RT 05 RW 03',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
            // END DESKRIPSI MASALAH SECTION
            // PROGRESS LAPORAN SECTION
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: const Color.fromRGBO(167, 167, 167, 1),
                        width: 1, // Border width
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            'Progres Laporan',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: TimelineTile(
                            axis: TimelineAxis.vertical,
                            alignment: TimelineAlign.manual,
                            lineXY: 0,
                            isFirst: true,
                            indicatorStyle: const IndicatorStyle(
                              width: 15,
                              color: Color.fromRGBO(167, 167, 167, 1),
                            ),
                            beforeLineStyle: const LineStyle(
                              color: Color.fromRGBO(167, 167, 167, 1),
                              thickness: 1,
                            ),
                            endChild: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Menunggu',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Laporan diterima oleh bagian Fasilitas Umum',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  '22:04 WIB',
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
                ],
              ),
            )
            // END PROGRESS LAPORAN SECTION
          ],
        ),
      ),
    );
  }
}