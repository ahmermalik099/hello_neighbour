import 'package:flutter/material.dart';

class ChatRow extends StatelessWidget {
  const ChatRow({super.key, required this.index, required this.message});
  final int index;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
            key: UniqueKey(),
            onDismissed: (direction) {
              // use state management later to remove the item from the list
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Message dismissed'),
                ),
              );
            },
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: const Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:16.0),
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 20),
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage('assets/1.webp'),
                      backgroundColor: Colors.transparent,
                    ),
                    SizedBox(width: 30),
                    Column(
                      children: [
                        Text(
                          'Suguro Geto',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(message),
                      ],
                    ),
                    
                  ],
                ),
              ),
            ),
          );
  }
}