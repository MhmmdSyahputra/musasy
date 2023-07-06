import 'package:flutter/material.dart';
import 'package:musasy/screen/buatJadwal.dart';
import 'package:musasy/screen/listMyjadwalScreen.dart';

class PembayaranScreen extends StatefulWidget {
  final data;
  const PembayaranScreen({super.key, this.data});

  @override
  State<PembayaranScreen> createState() => _PembayaranScreenState();
}

class _PembayaranScreenState extends State<PembayaranScreen> {
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
      body: Padding(
        padding: EdgeInsets.only(top: 10, left: 10, right: 10),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.collections_bookmark,
                  color: Colors.white,
                  size: 35,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Booking',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )
              ],
            ),
            Card(
              margin: EdgeInsets.only(top: 30),
              color: Colors.black,
              elevation: 10,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    height: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('${widget.data['gambar']}'),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    padding: EdgeInsets.all(15),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${widget.data['nama']}',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              Text(
                                '${widget.data['desc']}',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.grey),
                        onPressed: () {},
                        child: Text('Rp ${widget.data['harga']}'))),
                Container(
                    width: 140,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.red),
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20),
                                ),
                              ),
                              builder: (BuildContext context) {
                                return Container(
                                    constraints: BoxConstraints(
                                      maxHeight: 180,
                                    ),
                                    child: BuatJadwalScreen(
                                        gambar: widget.data['gambar'],
                                        studio: widget.data['nama']));
                              });
                        },
                        child: Text('Booking'))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
