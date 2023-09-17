import 'package:flutter/material.dart';


class ProfileImageCard extends StatelessWidget {
  const ProfileImageCard({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(children: [
        Image.asset(
          width: double.infinity,
          height: height * 0.35,
          'assets/2.webp',
          fit: BoxFit.cover,
        ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     IconButton(onPressed: (){
          //       setState(() {
          //         _iconColor=Colors.red;
          //       });
          //     },
          //       icon: Icon(Icons.favorite_outline_rounded,size: 40,),color: _iconColor, ),
          //     SizedBox(width: 20,),
          //     IconButton(onPressed: (){}, icon: Icon(Icons.heart_broken_outlined,size: 40,),color: Colors.white, ),
          //   ],
          // )
      ]
      ),
    );
  }
}
