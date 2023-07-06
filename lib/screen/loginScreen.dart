import 'package:flutter/material.dart';
import 'package:musasy/providers/providerLogin.dart';
import 'package:musasy/screen/homeScreen.dart';
import 'package:musasy/screen/regisScreen.dart';
import 'package:provider/provider.dart';

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

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final loginProv = Provider.of<UserProvider>(context);
    final TextEditingController _inputEmail = TextEditingController();
    final TextEditingController _inputPassword = TextEditingController();
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
                padding: const EdgeInsets.only(top: 120, bottom: 90),
                child: Column(
                  children: [
                    Text(
                      'MUSASY',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Music Sasy',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
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

              //------ Button
              Padding(
                padding: EdgeInsets.symmetric(vertical: 90),
                child: Container(
                  width: 150,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      //cari userlogin apakah ada atau tidak
                      final isFound = loginProv.allUser.any((user) =>
                          user.email == _inputEmail.text &&
                          user.password == _inputPassword.text);

                      //jika ada maka
                      if (isFound) {
                        //ambil data yg login itu
                        final dataUser = loginProv.allUser.firstWhere(
                          (user) =>
                              user.email == _inputEmail.text &&
                              user.password == _inputPassword.text,
                        );

                        //simpan username dan email user yg login
                        loginProv.sedangLogin(
                            dataUser.username, dataUser.email);

                        // lempar dia ke halaman utama
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => HomeScreen()));
                        return;
                      } else {
                        final snackBar = createSnackBar(
                            'Email atau Password Anda Salah.',
                            Colors.red,
                            'Coba Lagi');
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                    child: Text(
                      'Sign In',
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
                      'Belum Punya Akun? ',
                      style: TextStyle(color: Colors.white),
                    ),
                    InkWell(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => RegisScreen())),
                      child: Text(
                        'Sign Up',
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
