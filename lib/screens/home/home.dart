import 'package:flutter/material.dart';
import 'package:hello_neighbour/screens/home/components/home_card.dart';
import 'package:hello_neighbour/screens/home/components/showcase_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 40,),
            ShowcaseSlider(),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              children: [
                HomeCard(name: 'Explore', image: '1.webp',route: 'explore'),
                HomeCard(name: 'Chat', image: '2.webp', route: 'chat'),
                HomeCard(name: 'Settings', image: '1.webp', route: 'userProfile'),
                HomeCard(name: 'About App', image: '2.webp', route: 'onBoarding'),
              ],
            ),
          ]
        ),
      ),
    );
  }
}
