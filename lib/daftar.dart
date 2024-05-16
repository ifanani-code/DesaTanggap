import 'package:flutter/material.dart';

class Daftar extends StatefulWidget {
  const Daftar({super.key});

  @override
  State<Daftar> createState() => _DaftarState();
}

class _DaftarState extends State<Daftar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Text(
                'Daftar',
                style: TextStyle(
                    color: Color(0xFFD90429),
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('Selamat datang di aplikasi Desa tanggap',
                  style: TextStyle(
                      color: Color(0xFF2B2D42),
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 10,
              ),
              const Text(
                  'Desa Tanggap adalah aplikasi lapor untuk desa bojongsoang',
                  style: TextStyle(color: Color(0xFF2B2D42), fontSize: 16)),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/login');
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'Daftar',
                        style: TextStyle(fontSize: 16, color: Color(0xFFD90429)),
                      )),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Form(
                // key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFormField(
                      // controller: _usernameController,
                      decoration: const InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 12.5, horizontal: 15),
                          labelText: 'Username',
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Color(0xFF2B2D42)))),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Username tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10.0),
                    TextFormField(
                      // controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 12.5, horizontal: 15),
                          labelText: 'Password',
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Color(0xFF2B2D42)))),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 30.0),
                    ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Color(0xFF2B2D42)),
                            minimumSize:
                                MaterialStatePropertyAll(Size(300, 45)),
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)))),
                        child: Text(
                          'Masuk',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
