import 'package:flutter/material.dart';
import 'package:hello_neighbour/screens/home/components/home_card.dart';
import 'package:hello_neighbour/screens/home/components/showcase_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                HomeCard(name: 'News & Updates', image: 'news.svg', route: 'newsAndUpdates'),
                HomeCard(name: 'Help and Support', image: 'helpdesk.svg', route: 'customerSupport'), //help and FAQs
                HomeCard(name: 'About App', image: 'about.svg', route: 'onBoarding'),
                HomeCard(name: 'Rate The App', image: 'rating.svg',route: 'rating'),

              ],
            ),
          ]
        ),
      ),
    );
  }
}
