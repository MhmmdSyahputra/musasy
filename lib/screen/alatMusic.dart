import 'package:flutter/material.dart';
import 'package:musasy/data.dart';
import 'package:musasy/screen/listMyjadwalScreen.dart';

class AlatMusicScreen extends StatefulWidget {
  const AlatMusicScreen({super.key});

  @override
  State<AlatMusicScreen> createState() => _AlatMusicScreenState();
}

class _AlatMusicScreenState extends State<AlatMusicScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                        20), // Ganti dengan radius yang diinginkan
                  ),
                  filled: true,
                  fillColor: Colors.grey,
                  hintText: 'Cari Pin Anda',
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Icon(
                Icons.notifications,
                color: Colors.white,
                size: 30,
              ),
            ),
            InkWell(
              onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ScreenListJadwal())),
              child: Container(
                margin: EdgeInsets.only(left: 20),
                child: Icon(
                  Icons.calendar_month_sharp,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Row(
                  children: [
                    Icon(
                      Icons.headphones,
                      color: Colors.white,
                      size: 35,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Alat Musik',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Container(
                  child: GridView.count(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 2,
                childAspectRatio: 0.6,
                children: alatList.map((data) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${data['nama']}',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 15),
                          height: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                  image: AssetImage('${data['gambar']}'),
                                  fit: BoxFit.cover)),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
