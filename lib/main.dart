import 'package:flutter/material.dart';
import 'package:hello_neighbour/screens/auth/login.dart';
import 'package:hello_neighbour/screens/auth/register.dart';
import 'package:hello_neighbour/screens/chat/chat.dart';
import 'package:hello_neighbour/screens/chat/chatting.dart';
import 'package:hello_neighbour/screens/explore/explore.dart';
import 'package:hello_neighbour/screens/home/home.dart';
import 'package:hello_neighbour/screens/home/sub_items/help.dart';
import 'package:hello_neighbour/screens/home/sub_items/news_updates.dart';
import 'package:hello_neighbour/screens/home/sub_items/rating.dart';
import 'package:hello_neighbour/screens/onboard/onboard.dart';
import 'package:hello_neighbour/screens/pre_app.dart';
import 'package:hello_neighbour/screens/user/user_details.dart';
import 'package:hello_neighbour/screens/user/user_profile.dart';

import "package:firebase_core/firebase_core.dart";
import "firebase_options.dart";

Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
   );
   runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
        useMaterial3: true,
      ),
      initialRoute: '/checkScreen',
      routes: {
        '/checkScreen': (context)=> CheckScreen(), //check if user is logged in or not
        '/onBoarding': (context)=> OnboardingPage(),
        '/register': (context)=> RegisterScreen(),
        '/login': (context)=> LoginScreen(),
        '/home': (context)=> HomeScreen(),
        '/userProfile':(context) => UserProfileScreen(),
        '/chat':(context) => ChatScreen(),
        '/chatting':(context) => ChattingScreen(),
        '/explore':(context) => ExploreScreen(),
        '/userDetails':(context) => UserDetailsScreen(),

        '/newsAndUpdates':(context) => NewsAndUpdatesScreen(),
        '/customerSupport':(context) => CustomerSupportScreen(),
        '/rating':(context) => ExampleScreen(),


      },
    );
  }
}

