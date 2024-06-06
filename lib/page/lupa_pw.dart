import 'package:flutter/material.dart';

class LupaPW extends StatefulWidget {
  const LupaPW({super.key});

  @override
  State<LupaPW> createState() => _LupaPWState();
}

class _LupaPWState extends State<LupaPW> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Lupa password?',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Masukkan alamat email yang anda gunakan saat registrasi untuk dapat mengakses kembali akun anda',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(
                height: 30,
              ),
              Form(
                child: TextField(
                  // controller: _judulController,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 12.5, horizontal: 15),
                      hintText: 'Masukkan Email anda',
                      hintStyle: TextStyle(
                          color: Colors.grey.shade800,
                          fontWeight: FontWeight.normal),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: Color(0xFFD90429), width: 2)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor:
                          const MaterialStatePropertyAll(Color(0xFFD90429)),
                      minimumSize: const MaterialStatePropertyAll(
                          Size(double.infinity, 45)),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)))),
                  child: const Text(
                    'Kirim',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )),
            ],
          ),
        ));
  }
}
