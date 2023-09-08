import 'package:flutter/material.dart';

class MyMessage extends StatelessWidget {
  const MyMessage({super.key, required this.isUser, required this.msg});
  final bool isUser;
  final String msg;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment:
          isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if(!isUser)
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/2.webp'),
              ),
              if(!isUser)
              SizedBox(width: 5,),
              Container(
                width: width * 0.55,
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: isUser
                      ? Color.fromARGB(255, 33, 140, 176)
                      : Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  '$msg',
                  style: TextStyle(
                      fontSize: 20,
                      color: isUser ? Colors.white : Colors.black),
                ),
              ),
              if(isUser)
              SizedBox(width: 5,),
              if(isUser)
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/2.webp'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}