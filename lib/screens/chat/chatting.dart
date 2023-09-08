import 'package:flutter/material.dart';
import 'package:hello_neighbour/screens/chat/components/chat_row.dart';
import 'package:hello_neighbour/screens/chat/components/msg.dart';

class ChattingScreen extends StatelessWidget {
  const ChattingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 33, 140, 176),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 15,
              backgroundImage: AssetImage('assets/1.webp'),
            ),
            SizedBox(
              width: 5,
            ),
            const Text(
              'Father of this nation',
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            height: height * 0.8,
            width: width,
            child: Column(
              children: [
                 SizedBox(
                  height: 10,
                ),
                MyMessage(
                  isUser: true,
                  msg: "YOLOOOOOOo",
                ),
                SizedBox(
                  height: 10,
                ),
                MyMessage(
                  isUser: false,
                  msg: "COooking maybe potentially probably",
                ),
              ],
            ),
          ),
          Container(
            height: height * 0.1,
            width: width,
            child: Row(
              children: [
                Container(
                  width: width * 0.8,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Message',
                    ),
                  ),
                ),
                Container(
                  width: width * 0.2,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.send),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
