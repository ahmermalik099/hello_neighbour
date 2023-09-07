import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition:
            CameraPosition(target: LatLng(33.7077, 73.0498), zoom: 15),
        myLocationEnabled: true,
        tiltGesturesEnabled: false,
        compassEnabled: true,
        scrollGesturesEnabled: true,
        zoomGesturesEnabled: true,
        onMapCreated: (controller) {
          // _controller = controller;
        },
        markers: {
          Marker(
            markerId: MarkerId('Sydney'),
            position: LatLng(33.7077, 73.0498),
            onTap: () {
              const snackBar = SnackBar(
                content: Text('Yay! A SnackBar!'),
              );

              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              // open a dialog
               
              //  AlertDialog();
            },
          ),
        },
      ),
    );
  }
}
