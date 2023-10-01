import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hello_neighbour/screens/chat/components/chat_row.dart';
import 'package:hello_neighbour/services/fire_store.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<String> messages = [
    'Message 1',
    'Message 2',
    'Message 3',
    'Message 4',
    'Message 5',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
      ),
      body: StreamBuilder(
        stream: FirestoreService().getChatsForUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator(); // Show a loading indicator while data is being fetched.
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Text(
                'Not Marked'); // Display a message if there's no data.
          } else {
            // Display the data from Firestore in your UI.
            //Map<String, dynamic> data = snapshot.data!.docs[0].data();
            // Use the data to build your UI for each document.
            final chatDocs = snapshot.data!.docs;
           // String status = '';

            return ListView.builder(
              itemCount: chatDocs.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> data = chatDocs[index].data() as Map<String, dynamic>;
                return Column(
                  children: [
                    GestureDetector(
                        onTap: () async {
                          List<dynamic> chatters=data['chatters'];
                          log("chatters: ${chatters}");
                          var otherUser = chatters.where((id) => id!=FirebaseAuth.instance.currentUser!.uid).toList();
                          log('${otherUser}');
                          final user= await FirestoreService().getUser(otherUser.first);
                          // user is null
                          print(user);
                          final chatId=await FirestoreService().checkIfBothChattersExist(chatters);
                          user['chatId']=chatId;
                          Navigator.pushNamed(context, '/chatting',arguments: user);
                        },
                        child: ChatRow(message: data["last_message"])),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}




