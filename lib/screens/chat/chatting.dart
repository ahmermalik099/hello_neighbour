import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hello_neighbour/screens/chat/components/chat_row.dart';
import 'package:hello_neighbour/screens/chat/components/msg.dart';
import 'package:hello_neighbour/services/fire_store.dart';

class ChattingScreen extends StatelessWidget {
  const ChattingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final user = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    String message = '';

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
            child: MessageStream(chatId: user['chatId'],),
          ),
          Container(
            height: height * 0.1,
            width: width,
            child: Row(
              children: [
                Container(
                  width: width * 0.8,
                  child: TextField(
                    onChanged: (value) {
                      message = value;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Message',
                    ),
                  ),
                ),
                Container(
                  width: width * 0.2,
                  child: IconButton(
                    onPressed: () async {
                      FirestoreService().updateChatsCollection([user["uid"],FirebaseAuth.instance.currentUser!.uid],user['chatId'], message);
                    },
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


class MessageStream extends StatelessWidget {
  const MessageStream({Key? key, required this.chatId}) : super(key: key);

  final String chatId;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirestoreService().getMessagesForChat(chatId),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          final messagesDocs = snapshot.data!.docs;
          return ListView.builder(
            itemCount: messagesDocs.length,
            itemBuilder: (context, index) {
              return MyMessage(
                isUser: messagesDocs[index]['created_by'] == FirebaseAuth.instance.currentUser!.uid,
                msg: messagesDocs[index]['message'],
              );
            },
          );
        } else if (!snapshot.hasData){
          return Center(
            child: Text('No messages yet'),
          );
        }
        else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}



// SizedBox(
// height: 10,
// ),
// MyMessage(
// isUser: true,
// msg: "YOLOOOOOOo",
// ),
// SizedBox(
// height: 10,
// ),
// MyMessage(
// isUser: false,
// msg: "COooking maybe potentially probably",
// ),