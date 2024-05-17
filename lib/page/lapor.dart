import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Lapor extends StatefulWidget {
  final File image;
  const Lapor({super.key, required this.image});

  @override
  State<Lapor> createState() => _LaporState();
}

class _LaporState extends State<Lapor> {
  String? valueChoose;
  List<String> listKategori = [
    'Jalan',
    'Fasilitas Sosial/Fasilitas Umum',
    'Jaringan Listrik',
    'Saluran Air',
  ];

  String pelapor = 'Bukan anonimous';
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Lapor'),
        ),
        body: SingleChildScrollView(
            child: Form(
                child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              // const SizedBox(
              //   height: 50,
              // ),
              Image.file(widget.image, width: 100,), 
              SizedBox(height: 20,),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 2.5),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.5),
                    borderRadius: BorderRadius.circular(10)),
                child: DropdownButton(
                  hint: const Text('Kategori laporan'),
                  underline: const SizedBox(),
                  dropdownColor: Colors.white,
                  value: valueChoose,
                  isExpanded: true,
                  style:
                      const TextStyle(fontSize: 16, color: Color(0xFF2B2D42)),
                  onChanged: (newValue) {
                    setState(() {
                      valueChoose = newValue;
                    });
                  },
                  items: listKategori.map((valueItem) {
                    return DropdownMenuItem(
                        value: valueItem, child: Text(valueItem));
                  }).toList(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 10),
                    hintText: 'Judul Laporan',
                    focusedBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFF2B2D42), width: 2)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 65, horizontal: 10),
                    hintText: 'Detail Laporan',
                    hintStyle: const TextStyle(),
                    focusedBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFF2B2D42), width: 2)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              const SizedBox(
                height: 20,
              ),
              RadioListTile<String>(
                toggleable: true,
                title: const Text(
                  'Kirim sebagai anonimous',
                  style: TextStyle(fontSize: 16),
                ),
                value: 'Kirim sebagai anonimous',
                groupValue: selectedValue,
                activeColor: const Color(0xFF2B2D42),
                onChanged: (String? value) {
                  setState(() {
                    if (selectedValue == value) {
                      selectedValue = null;
                    } else {
                      selectedValue = value;
                    }
                  });
                },
              ),

              // RadioListTile(
              //     value: 'Kirim sebagai anonimous',
              //     groupValue: pelapor,
              //     onChanged: (String? value){
              //       if (selectedValue == value){
              //         pelapor = selectedValue!;
              //       } else {
              //         pelapor;
              //       }
              //     },
              //     // onChanged: (selectedValue) {
              //     //   setState(() {
              //     //     pelapor = selectedValue!;
              //     //   });
              //     // },
              //     title: const Text(
              //       'Kirim sebagai anonimous',
              //       style: TextStyle(fontSize: 16),
              //       textAlign: TextAlign.left,
              //     )),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor:
                          const MaterialStatePropertyAll(Color(0xFFD90429)),
                      minimumSize:
                          const MaterialStatePropertyAll(Size(320, 45)),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)))),
                  child: const Text(
                    'Lapor',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )),

              // ListTile(
              //   title: const Text('Submit sebagai anonimous'),
              //   leading: Radio<Pelapor>(value: Pelapor.anonimous, groupValue: Pelapor.anonimous, onChanged: (Pelapor? value){
              //     setState(() {

              //     });
              //   })),
            ],
          ),
        ))));
  }
}
