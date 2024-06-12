// import 'package:homepage/page/lapor.dart';
// import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:homepage/services/shared_service.dart';
import 'package:flutter/material.dart';
import 'laporan_saya.dart';
import 'dart:convert';

class LaporanMasyarakat extends StatefulWidget {
  const LaporanMasyarakat({Key? key}) : super(key: key);

  @override
  _LaporanMasyarakatState createState() => _LaporanMasyarakatState();
}

class _LaporanMasyarakatState extends State<LaporanMasyarakat> {
  File? _selectedImage;
  late List<Map<String, dynamic>> _laporanList = []; // List laporan

  @override
  void initState() {
    super.initState();
    _fetchLaporan();
  }

  Future<void> _fetchLaporan() async {
    var loginDetails = await SharedService.loginDetails();
    var token = loginDetails?.token;

    if (token != null) {
      var semuaLaporan = await SharedService.getAllLaporan(token);
      print(semuaLaporan);
      setState(() {
        _laporanList =
            json.decode(semuaLaporan)['data'].cast<Map<String, dynamic>>();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Laporan Masyarakat',
              style: TextStyle(
                color: Color(0xFFD90429),
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LaporanSaya()),
                );
              },
              child: const Text(
                'Laporan Saya',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 15),
                      child: TextField(
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
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 17, vertical: 12),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Laporan Terbaru',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Poppins',
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _laporanList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
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
                                        height: 120,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      left: 0,
                                      right: 0,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: _getColorForStatus(
                                              _laporanList[index]['status']),
                                          borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(15),
                                            bottomRight: Radius.circular(15),
                                          ),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5),
                                        child: Text(
                                          _laporanList[index]['status'] ?? '',
                                          style: const TextStyle(
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 8,
                                                vertical: 4,
                                              ),
                                              child: Text(
                                                _laporanList[index]
                                                        ['kategori'] ??
                                                    '',
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              _laporanList[index]
                                                      ['lokasiLaporan'] ??
                                                  '',
                                              style: const TextStyle(
                                                color: Colors.grey,
                                                fontSize: 10,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          _laporanList[index]['judulLaporan'] ??
                                              '',
                                          style: const TextStyle(
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
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
            ),
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
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () => _selectedImage,
                          style: const ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Color(0xFF2B2D42)),
                            foregroundColor:
                                WidgetStatePropertyAll(Colors.white),
                          ),
                          child: const Text('Unggah foto'),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        ElevatedButton(
                          onPressed: () => _selectedImage,
                          style: const ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Color(0xFFD90429)),
                            foregroundColor:
                                WidgetStatePropertyAll(Colors.white),
                          ),
                          child: const Text('Ambil foto'),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    _selectedImage != null
                        ? Image.file(_selectedImage!)
                        : const Text(''),
                  ],
                ),
              ),
            ),
          );
        },
        backgroundColor: const Color(0xFFD90429),
        shape: const CircleBorder(),
        child: const Icon(
          Icons.camera_alt,
          color: Colors.white,
        ),
      ),
    );
  }

  Color _getColorForStatus(String? status) {
    switch (status) {
      case 'MENUNGGU':
        return const Color.fromRGBO(
            168, 168, 168, 1); // Ubah sesuai dengan warna yang Anda inginkan
      case 'DIPROSES':
        return const Color.fromRGBO(
            255, 246, 30, 1); // Ubah sesuai dengan warna yang Anda inginkan
      case 'SELESAI':
        return const Color.fromRGBO(4, 217, 115, 1);
      case 'DITOLAK':
        return const Color.fromRGBO(217, 4, 41, 1);
      default:
        return Colors.transparent; // Warna default jika status tidak ditemukan
    }
  }
}
