import 'package:flutter/material.dart';
import 'package:hello_neighbour/screens/home/components/showcase_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ShowcaseSlider(),
        ],
      ),
    );
  }
}
