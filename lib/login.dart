import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _passwordVisible = false;

  void _login() {
    if (_formKey.currentState!.validate()) {
      String username = _usernameController.text;
      String password = _passwordController.text;

      // Periksa apakah username dan password sesuai dengan nilai yang diharapkan
      if (username == 'fanani' && password == 'desatanggap') {
        // Jika benar, navigasi ke halaman profil
        Navigator.pushReplacementNamed(context, '/beranda', arguments: {
          'username': username,
          'password': password,
        });
      } else {
        // Jika salah, tampilkan pesan kesalahan
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Username atau password salah'),
            // backgroundColor: Colors.red,
          ),
        );
      }
    }
  }


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
              const Text('Desa tanggap',
                  style: TextStyle(
                      color: Color(0xFFD90429),
                      fontSize: 28,
                      fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 15,
              ),
              const Text('aplikasi e-lapor untuk respons cepat masalah desa',
                  style: TextStyle(color: Color(0xFF2B2D42), fontSize: 16, fontWeight: FontWeight.w600)),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Masuk',
                          style:
                              TextStyle(color: Color(0xFFD90429), fontSize: 16),
                        )),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Daftar',
                          style:
                              TextStyle(color: Color(0xFF8D99AE), fontSize: 16),
                        )),
                  ],
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: _usernameController,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 12.5, horizontal: 15),
                        labelText: 'Username',
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xFF2B2D42), width: 2)),
                      ),
                      // validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return 'Username tidak boleh kosong';
                      //   }
                      //   return null;
                      // },
                    ),
                    const SizedBox(height: 10.0),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: !_passwordVisible,
                      decoration: InputDecoration(

                          // focusColor: Color(0xFFD90429),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                            icon: const Icon(Icons.remove_red_eye_outlined),
                            color: Colors.grey,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 12.5, horizontal: 15),
                          labelText: 'Password',
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF2B2D42), width: 2)),
                          border: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Color(0xFF2B2D42)))),
                      // validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return 'Password tidak boleh kosong';
                      //   }
                      //   return null;
                      // },
                    ),
                    const SizedBox(height: 30.0),
                    ElevatedButton(
                        onPressed: _login,
                        style: ButtonStyle(
                            backgroundColor: const MaterialStatePropertyAll(
                                Color(0xFFD90429)),
                            minimumSize:
                                const MaterialStatePropertyAll(Size(300, 45)),
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)))),
                        child: const Text(
                          'Masuk',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )),
                  ],
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Lupa Password?',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            color: Color(0xFFD90429),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ))
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              SizedBox(
                width: 300,
                child: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text:
                            "Dengan masuk ke aplikasi, anda menyetujui segala ",
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFF8D99AE),
                        ),
                      ),
                      TextSpan(
                        text: "Syarat dan Ketentuan ",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 15,
                            color: Color(0xFF2B2D42),
                            fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: "dan ",
                        style:
                            TextStyle(fontSize: 15, color: Color(0xFF8D99AE)),
                      ),
                      TextSpan(
                        text: "Kebijakan Privasi Desa Tanggap",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 15,
                            color: Color(0xFF2B2D42),
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 45,
              ),
              const Divider(),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Belum punya akun?',
                    style: TextStyle(color: Color(0xFF8D99AE), fontSize: 15),
                  ),
                  TextButton(
                      onPressed: () => Navigator.pushReplacementNamed(
                            context,
                            '/daftar',
                          ),
                      child: const Text(
                        'Daftar di sini.',
                        style: TextStyle(
                            color: Color(0xFF2B2D42),
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ))
                ],
              )
            ],
          )),
    );
  }
}
