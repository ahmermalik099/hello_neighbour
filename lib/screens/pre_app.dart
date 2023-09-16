import 'package:flutter/material.dart';
import 'package:hello_neighbour/screens/auth/login.dart';
import 'package:hello_neighbour/screens/home/home.dart';
import 'package:hello_neighbour/screens/onboard/onboard.dart';

import '../services/auth.dart';

class CheckScreen extends StatelessWidget {
  const CheckScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthService().userStream, // when user changes builder will run again
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return  Center(
            child: Text('Something went wrong!'),
          );
        } else if (snapshot.hasData) { //user is logged in
          return OnboardingPage();
        } else { //user is null
          return LoginScreen();
        }
      },
    );
  }
}