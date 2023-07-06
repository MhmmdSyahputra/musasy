import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:musasy/model/modelLogin.dart';
import 'package:musasy/providers/providerLogin.dart';
import 'package:musasy/screen/loginScreen.dart';
import 'package:provider/provider.dart';

class ScreenProfile extends StatefulWidget {
  const ScreenProfile({super.key});

  @override
  State<ScreenProfile> createState() => _ScreenProfileState();
}

class _ScreenProfileState extends State<ScreenProfile> {
  @override
  Widget build(BuildContext context) {
    final userProv = Provider.of<UserProvider>(context);
    final dataUser =
        userProv.getUser(userProv.usernameUserLogin, userProv.emailUserLogin);

    ImageProvider? gambar;
    getFromGallery() async {
      XFile? pickedFile = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );
      if (pickedFile != null) {
        final bytes = await pickedFile.readAsBytes();
        setState(() {
          gambar = MemoryImage(bytes);
          userProv.update(
              dataUser.email,
              dataUser.username,
              ModelUser(
                  username: dataUser.username,
                  email: dataUser.email,
                  password: dataUser.password,
                  profile: gambar));
        });
      }
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Profile'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            dataUser.profile == null
                ? Center(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          getFromGallery();
                        });
                      },
                      child: Container(
                        width: 300,
                        height: 250,
                        child: CircleAvatar(
                          child: Icon(
                            Icons.person,
                            size: 200,
                          ),
                        ),
                      ),
                    ),
                  )
                : Center(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          getFromGallery();
                        });
                      },
                      child: Container(
                        width: 300,
                        height: 250,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: dataUser.profile!,
                            )),
                      ),
                    ),
                  ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 80),
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                    'Email',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  )),
                  Expanded(
                      child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      '${dataUser.email}',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                  ))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 40),
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                    'Username',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  )),
                  Expanded(
                      child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      '${dataUser.username}',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                  ))
                ],
              ),
            ),
            Center(
              child: Container(
                width: 150,
                height: 50,
                margin: EdgeInsets.only(top: 100),
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginScreen())),
                  child: Text(
                    'Logout',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      primary: Colors.red),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
