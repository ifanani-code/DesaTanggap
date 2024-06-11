import 'package:flutter/material.dart';
import 'package:homepage/services/shared_service.dart';
import 'dart:convert';

class DataDiri extends StatefulWidget {
  const DataDiri({super.key});

  @override
  State<DataDiri> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<DataDiri> {
  late Map<String, dynamic> userProfileData = {};
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getUserProfileData();
  }

  void getUserProfileData() async {
    var loginDetails = await SharedService.loginDetails();
    var token = loginDetails?.token;

    if (token != null) {
      var profileData = await SharedService.getUserProfile(token);
      setState(() {
        userProfileData = json.decode(profileData);
        // Set nilai awal untuk TextEditingController setelah userProfileData diperbarui
        _nameController.text = userProfileData.isNotEmpty ? userProfileData['data'][0]['fullName'] : '';
        _usernameController.text = userProfileData.isNotEmpty ? userProfileData['data'][0]['username'] : '';
        _emailController.text = userProfileData.isNotEmpty ? userProfileData['data'][0]['email'] : '';
        _addressController.text = userProfileData.isNotEmpty ? userProfileData['data'][0]['address'] : '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        titleSpacing: 0,
        title: const Text('Edit Profil', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20)),
        actions: [
          TextButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // Simpan data
                Navigator.of(context).pop();
              }
            },
            child: const Text(
              'Simpan',
              style: TextStyle(color: Color(0xFFD90429), fontSize: 16  ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Center(
                child: Stack(
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundColor: Color(0xFFD90429),
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 50,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: CircleAvatar(
                        radius: 17.5,
                        backgroundColor: Colors.white,
                        child: IconButton(
                          onPressed: () {
                            
                          },
                          icon: Icon(Icons.camera_alt,
                          color: Color(0xFFD90429),
                          size: 17.5,)
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Informasi Data Diri',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        labelText: 'Nama Lengkap',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Nama lengkap tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _usernameController,
                      decoration: const InputDecoration(
                        labelText: 'Nama Pengguna',
                      ),
                      readOnly: true,
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email tidak boleh kosong';
                        }
                        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return 'Masukkan email yang valid';
                        }
                        return null;
                      },
                    ),
                    // const SizedBox(height: 10),
                    // TextFormField(
                    //   controller: _phoneController,
                    //   decoration: const InputDecoration(
                    //     labelText: 'Nomor HP',
                    //   ),
                    //   validator: (value) {
                    //     if (value == null || value.isEmpty) {
                    //       return 'Nomor HP tidak boleh kosong';
                    //     }
                    //     return null;
                    //   },
                    // ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _addressController,
                      decoration: const InputDecoration(
                        labelText: 'Alamat Lengkap',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Alamat lengkap tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}