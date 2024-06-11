import 'package:flutter/material.dart';
// import 'package:homepage/config.dart';
import 'package:homepage/models/login_request_model.dart';
import 'package:homepage/models/regist_request_model.dart';
import 'package:homepage/page/lupa_pw.dart';
import 'package:homepage/services/api_service.dart';
// import 'package:snippet_coder_utils/FormHelper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
        length: 2,
        child: Scaffold(
          body: Column(
            children: <Widget>[
              SizedBox(
                height: 75,
              ),
              SizedBox(
                  height: 130,
                  child: Column(
                    children: [
                      Text('Desa Tanggap',
                          style: TextStyle(
                              color: Color(0xFFD90429),
                              fontSize: 28,
                              fontWeight: FontWeight.bold)),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                        child: Text(
                            'Aplikasi E-lapor untuk respons cepat masalah desa',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w600)),
                      ),
                    ],
                  )),

              // Tab-bar
              SizedBox(
                height: 50,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 75),
                      child: TabBar(
                          dividerColor: Colors.white,
                          labelColor: Color(0xFFD90429),
                          indicatorColor: Color(0xFFD90429),
                          unselectedLabelColor: Colors.grey,
                          tabs: [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                'Masuk',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                'Daftar',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ]),
                    )
                  ],
                ),
              ),
              Expanded(
                  child: TabBarView(children: [
                Masuk(),
                Daftar(),
              ]))
            ],
          ),
        ));
  }
}

class Masuk extends StatefulWidget {
  const Masuk({super.key});

  @override
  State<Masuk> createState() => _MasukState();
}

class _MasukState extends State<Masuk> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _passwordVisible = false;
  bool isAPICallProcess = false;

  void _login() {
    if (validateAndSave()) {
      String username = _usernameController.text;
      String password = _passwordController.text;

      setState(() {
        isAPICallProcess = true;
      });

      LoginRequestModel model =
          LoginRequestModel(username: username, password: password);

      APIService.login(model).then((response) {
        if (response) {
          Navigator.pushNamedAndRemoveUntil(
              context, '/beranda', (Route) => false);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Username atau password salah'),
            ),
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.fromLTRB(15, 30, 15, 0),
      child: Column(
        children: <Widget>[
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                      // prefixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.mail)),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 12.5, horizontal: 15),
                      labelText: 'Username',
                      floatingLabelStyle:
                          TextStyle(color: Colors.grey.shade800),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: Color(0xFFD90429), width: 2))),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Username tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 25.0),
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
                      labelText: 'Kata sandi',
                      floatingLabelStyle:
                          TextStyle(color: Colors.grey.shade800),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFFD90429),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30.0),
                ElevatedButton(
                    onPressed: _login,
                    style: ButtonStyle(
                        backgroundColor:
                            const WidgetStatePropertyAll(Color(0xFFD90429)),
                        minimumSize: const WidgetStatePropertyAll(
                            Size(double.infinity, 45)),
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
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
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const LupaPW())),
                  child: const Text(
                    'Lupa kata sandi?',
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
                style: TextStyle(height: 1.4),
                children: [
                  TextSpan(
                    text: "Dengan masuk ke aplikasi, anda menyetujui segala ",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                  TextSpan(
                    text: "Syarat dan Ketentuan ",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xFFD90429),
                        decorationThickness: 2,
                        fontSize: 15,
                        color: Color(0xFFD90429),
                        fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: "dan ",
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                  TextSpan(
                    text: "Kebijakan Privasi Desa Tanggap",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xFFD90429),
                        decorationThickness: 2,
                        fontSize: 15,
                        color: Color(0xFFD90429),
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 51,
          ),
        ],
      ),
    ));
  }

  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }
}

class Daftar extends StatefulWidget {
  const Daftar({super.key});

  @override
  State<Daftar> createState() => _DaftarState();
}

class _DaftarState extends State<Daftar> {
  int currentStep = 0;
  bool isCompleted = false;
  bool _passwordVisible = false;

  final _formKey = GlobalKey<FormState>();
  final nama = TextEditingController();
  final username = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  List<Step> getSteps() => [
        Step(
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 0,
          title: const Text(''),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Siapa nama kamu?',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: nama,
                decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    hintText: 'Nama lengkap',
                    hintStyle: TextStyle(
                        color: Colors.grey.shade800,
                        fontWeight: FontWeight.normal),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 12.5, horizontal: 15),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Apa alamat email kamu?',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: email,
                decoration: InputDecoration(
                    hintText: 'Alamat email',
                    hintStyle: TextStyle(
                        color: Colors.grey.shade800,
                        fontWeight: FontWeight.normal),
                    enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Colors.grey)),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 12.5, horizontal: 15),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email tidak boleh kosong';
                  }
                  return null;
                },
              )
            ],
          ),
        ),
        Step(
          state: currentStep > 1 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 1,
          title: const Text(''),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Buat nama penggunamu',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: username,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.grey)),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 12.5),
                    hintText: 'Username',
                    hintStyle: TextStyle(
                        color: Colors.grey.shade800,
                        fontWeight: FontWeight.normal)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Username tidak boleh kosong';
                  }
                  return null;
                },
              )
            ],
          ),
        ),
        Step(
          state: currentStep > 2 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 2,
          title: const Text(''),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Buat kata sandimu',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: password,
                obscureText: !_passwordVisible,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                      icon: const Icon(Icons.remove_red_eye_outlined),
                      color: Colors.grey,
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.grey)),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 12.5),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: 'Kata Sandi',
                    hintStyle: TextStyle(
                        color: Colors.grey.shade800,
                        fontWeight: FontWeight.normal)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Kata sandi tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Kata sandi minimal 6 karakter dengan huruf (a-z), angka (0-9), titik (.), dan/atau garis bawah (_)',
                style: TextStyle(fontSize: 15, color: Colors.grey),
              )
            ],
          ),
        ),
        Step(
          state: currentStep > 3 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 3,
          title: const Text(''),
          content: const Column(
            children: <Widget>[
              Text(
                'Semua sudah siap!',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ];

  buildCompleted() {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Berhasil daftar!',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 25,
              ),
              Image.asset(
                'assets/Teamwork.png',
                height: 200,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 25,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          const WidgetStatePropertyAll(Color(0xFFD90429)),
                      minimumSize: const WidgetStatePropertyAll(
                          Size(double.infinity, 45)),
                      padding: const WidgetStatePropertyAll(
                          EdgeInsets.symmetric(horizontal: 15, vertical: 12.5)),
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)))),
                  onPressed: () => setState(() {
                        isCompleted = false;
                        currentStep = 0;

                        nama.clear();
                        email.clear();
                        password.clear();

                        Navigator.pushNamed(context, '/login');
                      }),
                  child: const Text(
                    'Selesai',
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  void _register() {
    if (_formKey.currentState!.validate()) {
      RegisterRequestModel model = RegisterRequestModel(
        fullName: nama.text,
        username: username.text,
        email: email.text,
        password: password.text,
      );

      APIService.register(model).then((response) {
        if (response) {
          setState(() {
            isCompleted = true;
          });
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Registrasi gagal, coba lagi.'),
            ),
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isCompleted
          ? buildCompleted()
          : Form(
              key: _formKey,
              child: Theme(
                data: Theme.of(context).copyWith(
                  colorScheme:
                      const ColorScheme.light(primary: Color(0xFFD90429)),
                ),
                child: Stepper(
                  elevation: 0,
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  connectorThickness: 0,
                  type: StepperType.horizontal,
                  steps: getSteps(),
                  currentStep: currentStep,
                  onStepTapped: (step) => setState(() => currentStep = step),
                  onStepContinue: () {
                    final isLastStep = currentStep == getSteps().length - 1;
                    if (isLastStep) {
                      _register();
                    } else {
                      setState(() {
                        currentStep += 1;
                      });
                    }
                  },
                  onStepCancel: () {
                    if (currentStep == 0) {
                      return;
                    }
                    setState(() {
                      currentStep -= 1;
                    });
                  },
                  controlsBuilder:
                      (BuildContext context, ControlsDetails details) {
                    final isLastStep = currentStep == getSteps().length - 1;
                    return Container(
                      margin: const EdgeInsets.only(top: 50),
                      child: Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: details.onStepContinue,
                              style: ButtonStyle(
                                  backgroundColor: const WidgetStatePropertyAll(
                                      Color(0xFFD90429)),
                                  minimumSize: const WidgetStatePropertyAll(
                                      Size(double.infinity, 45)),
                                  shape: WidgetStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)))),
                              child: Text(
                                isLastStep ? 'Konfirmasi' : 'Selanjutnya',
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          if (currentStep != 0)
                            Expanded(
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        const WidgetStatePropertyAll(
                                            Color(0xFF2B2D42)),
                                    minimumSize: const WidgetStatePropertyAll(
                                        Size(double.infinity, 45)),
                                    shape: WidgetStatePropertyAll(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)))),
                                onPressed: details.onStepCancel,
                                child: const Text(
                                  'Kembali',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
    );
  }
}
