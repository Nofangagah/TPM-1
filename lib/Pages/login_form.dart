import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscure = true;
  final usernameCotroller = TextEditingController();
  final passwordController = TextEditingController();

  final List<Map<String, String>> users = [
    {
      "username": "nofan".toLowerCase().trim(),
      "password": "123220023".trim(),
    },
    {
      "username": "farid".toLowerCase().trim(),
      "password": "123220094".trim(),
    },
    
  ];

  void login() {
  String username = usernameCotroller.text.toLowerCase().trim();
  String password = passwordController.text.toLowerCase().trim();

  bool isValidUser = users.any(
    (user) =>
        user['username']!.toLowerCase().trim() == username && user['password']!.trim() == password,
  );

  if (isValidUser) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Login Berhasil")));
    Navigator.pushNamed(context, '/home');
  } else {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Login Gagal")));
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Welcome Back",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Enter your credentials to continue",
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: usernameCotroller,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Username',
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: passwordController,
                        obscureText: _isObscure,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isObscure
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () {
                              setState(() {
                                _isObscure =! _isObscure;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        onPressed: login,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child:
                    Container(), // Bagian kosong, bisa diisi dengan elemen lain jika perlu
              ),
            ],
          ),
        ),
      ),
    );
  }
}
