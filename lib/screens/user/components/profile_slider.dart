import 'dart:developer';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:hello_neighbour/screens/home/components/showcase_card.dart';
import 'package:hello_neighbour/screens/user/components/profile_image_card.dart';

class ProfileSlider extends StatelessWidget {
  const ProfileSlider({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.cyanAccent.shade700,
        ),
        height: height * 0.4,
        width: double.infinity,
        child: Swiper(
          autoplay: true,
          itemBuilder: (BuildContext context, int index) {
            return ProfileImageCard(
            );
          },
          itemCount: 2,
          pagination: const SwiperPagination(),
          control: null,
        ),
      ),
    );
  }
}
