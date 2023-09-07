import 'package:flutter/material.dart';
import 'package:hello_neighbour/screens/chat/components/chat_row.dart';

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
      body: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ChatRow(message: messages[index], index: index),
              SizedBox(
                height: 10,
              ),
            ],
          );
        },
      ),
    );
  }
}
