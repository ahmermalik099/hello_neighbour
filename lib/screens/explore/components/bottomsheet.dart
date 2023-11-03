import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hello_neighbour/riverpod/bottomsheet/bottomsheet_provider.dart';

class BottomSheetUser extends ConsumerWidget {
  const BottomSheetUser({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(bottomSheetUserProvider);
    log(user.toString());

    return user != null ? Positioned(
      bottom: 80,
      left: 0,
      right: 0,
      child: Container(
        height: 220,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.deepPurple,
              Colors.blueAccent.shade200,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            children: [
              CircleAvatar(
                backgroundImage:
                    NetworkImage('${user?.pfp_url ?? 'https://i0.wp.com/thegeekiary.com/wp-content/uploads/2022/12/bleach-blades.jpg?resize=620%2C435&ssl=1'}') as ImageProvider,
                radius: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.star_border_outlined,
                      color: Colors.white, size: 50),
                  Column(
                    children: [
                      Text(
                        user?.userName ?? 'hi',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  Icon(
                    Icons.star_border_outlined,
                    color: Colors.white,
                    size: 50,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    )
    : Container();
  }
}
