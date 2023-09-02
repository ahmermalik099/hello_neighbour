import 'package:flutter/material.dart';
import 'package:hello_neighbour/screens/auth/login.dart';
import 'package:hello_neighbour/screens/auth/register.dart';
import 'package:hello_neighbour/screens/chat/chat.dart';
import 'package:hello_neighbour/screens/explore/explore.dart';
import 'package:hello_neighbour/screens/home/home.dart';
import 'package:hello_neighbour/screens/onboard/onboard.dart';
import 'package:hello_neighbour/screens/user/user_profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context)=> OnboardScreen(),
        '/register': (context)=> RegisterScreen(),
        '/login': (context)=> LoginScreen(),
        '/home': (context)=> HomeScreen(),
        '/userProfile':(context) => UserProfileScreen(),
        '/chat':(context) => ChatScreen(),
        '/explore':(context) => ExploreScreen(),
      },      
    );
  }
}

