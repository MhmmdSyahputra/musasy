import 'package:flutter/material.dart';
import 'package:musasy/screen/listMyjadwalScreen.dart';

class MessegerScreen extends StatefulWidget {
  const MessegerScreen({super.key});

  @override
  State<MessegerScreen> createState() => _MessegerScreenState();
}

class _MessegerScreenState extends State<MessegerScreen> {
  TextEditingController _inputMsgcontroller = TextEditingController();
  List<Map<String, dynamic>> _conversation = [
    {'text': 'Tanya kan Masalah booking disini', 'isUser': false}
  ];
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
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Row(
                children: [
                  Icon(
                    Icons.message,
                    color: Colors.white,
                    size: 35,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Messenger',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _conversation.length,
                itemBuilder: (context, index) {
                  final message = _conversation[index];
                  return Row(
                    mainAxisAlignment: message['isUser']
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Container(
                          width: 280,
                          padding: const EdgeInsets.all(8.0),
                          margin: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: message['isUser']
                                ? Colors.grey[200]
                                : Colors.grey[600],
                            borderRadius: message['isUser']
                                ? BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                    topLeft: Radius.circular(20))
                                : BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                    topRight: Radius.circular(20)),
                          ),
                          child: Text(
                            message['text'],
                            textAlign: message['isUser']
                                ? TextAlign.end
                                : TextAlign.start,
                            style: TextStyle(
                              color: message['isUser']
                                  ? Colors.black
                                  : Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _inputMsgcontroller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                        fillColor: Colors.grey,
                        hintText: 'Pesan',
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      setState(() {
                        _conversation.add(
                            {'text': _inputMsgcontroller.text, 'isUser': true});
                      });
                      _inputMsgcontroller.text = '';
                    },
                    child: Icon(
                      Icons.send,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
