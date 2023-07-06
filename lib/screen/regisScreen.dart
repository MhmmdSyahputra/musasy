import 'package:flutter/material.dart';
import 'package:musasy/model/modelLogin.dart';
import 'package:musasy/providers/providerLogin.dart';
import 'package:musasy/screen/loginScreen.dart';
import 'package:provider/provider.dart';

class RegisScreen extends StatefulWidget {
  const RegisScreen({super.key});

  @override
  State<RegisScreen> createState() => _RegisScreenState();
}

SnackBar createSnackBar(String text, Color color, String label) {
  return SnackBar(
    backgroundColor: color,
    content: Text(
      text,
      style: const TextStyle(color: Colors.black),
    ),
    action: SnackBarAction(
      label: label,
      onPressed: () {
        // Tambahkan aksi yang ingin Anda lakukan saat tombol pada SnackBar ditekan
      },
    ),
  );
}

class _RegisScreenState extends State<RegisScreen> {
  final TextEditingController _inputEmail = TextEditingController();
  final TextEditingController _inputUsername = TextEditingController();
  final TextEditingController _inputPassword = TextEditingController();
  final TextEditingController _inputCofirmPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final loginProv = Provider.of<UserProvider>(context);

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //------ header and sub login
              Padding(
                padding: const EdgeInsets.only(top: 120, bottom: 20),
                child: Column(
                  children: [
                    Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Silahkan Daftar dengan Email Anda!',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),

              //------ Form
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                child: Column(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.white,
                            width: 1.0,
                          ),
                        ),
                      ),
                      child: TextField(
                        controller: _inputEmail,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Email',
                          hintStyle: TextStyle(
                            color: Colors
                                .white, // Mengatur warna hint teks menjadi putih
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                child: Column(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.white,
                            width: 1.0,
                          ),
                        ),
                      ),
                      child: TextField(
                        controller: _inputUsername,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Username',
                          hintStyle: TextStyle(
                            color: Colors
                                .white, // Mengatur warna hint teks menjadi putih
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                child: Column(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.white,
                            width: 1.0,
                          ),
                        ),
                      ),
                      child: TextField(
                        controller: _inputPassword,
                        style: TextStyle(color: Colors.white),
                        obscureText: mounted,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Password',
                          hintStyle: TextStyle(
                            color: Colors
                                .white, // Mengatur warna hint teks menjadi putih
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                child: Column(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.white,
                            width: 1.0,
                          ),
                        ),
                      ),
                      child: TextField(
                        controller: _inputCofirmPassword,
                        style: TextStyle(color: Colors.white),
                        obscureText: mounted,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Konfirmasi Password',
                          hintStyle: TextStyle(
                            color: Colors
                                .white, // Mengatur warna hint teks menjadi putih
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //------ Button
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30),
                child: Container(
                  width: 150,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      // confirm password salah
                      if (_inputPassword.text != _inputCofirmPassword.text) {
                        final snackBar = createSnackBar(
                            'Konfirmasi Password Tidak Sesuai!',
                            Colors.orange,
                            'Coba Lagi');
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        return;
                      }

                      if (_inputUsername.text != '' ||
                          _inputEmail.text != '' ||
                          _inputPassword.text != '') {
                        loginProv.register(ModelUser(
                          username: _inputUsername.text,
                          email: _inputEmail.text,
                          password: _inputPassword.text,
                        ));
                        final snackBar = createSnackBar(
                            'Akun Berhasil Terdaftar', Colors.green, 'Oke');
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => LoginScreen()));
                      }
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(fontSize: 18),
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        primary: Colors.red),
                  ),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sudah Punya Akun? ',
                      style: TextStyle(color: Colors.white),
                    ),
                    InkWell(
                      onTap: () => Navigator.of(context).pop(),
                      child: Text(
                        'Sign In',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
