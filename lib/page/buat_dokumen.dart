import 'package:flutter/material.dart';

class BuatDokumen extends StatelessWidget {
  const BuatDokumen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // titleSpacing: 0,
        title: const Text(
          'Buat Dokumen',
          style:
              TextStyle(color: Color(0xFFD90429), fontWeight: FontWeight.bold,),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Dokumen apa yang ingin kamu buat?',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Card(
                child: InkWell(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      child: Image.asset(
                        'assets/KK.png',
                        width: 309,
                        height: 160,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 7.5, horizontal: 15),
                      child: Text(
                        'Kartu Keluarga',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Card(
                child: InkWell(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      child: Image.asset(
                        'assets/Akta.png',
                        width: 309,
                        height: 160,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 7.5, horizontal: 15),
                      child: Text(
                        'Akta Kelahiran',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
