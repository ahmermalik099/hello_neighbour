import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ExploreScreen extends StatefulWidget {
  ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    prepareMarkers();
  }

  void prepareMarkers() async {
    markerbitmap = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(50, 50)),
      "assets/1.webp",
    );

    markers.add(Marker(
      //add start location marker
      markerId: MarkerId(69.toString()),
      position: LatLng(33.7077, 73.0498), //posi\ion of marker
      infoWindow: InfoWindow(
        //popup info
        title: 'Starting Point ',
        snippet: 'Start Marker',
      ),
      icon: markerbitmap, //Icon for Marker
    ));

    setState(() {
      
    });
  }

  late BitmapDescriptor markerbitmap;
  Set<Marker> markers = Set();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition:
            CameraPosition(target: LatLng(33.7077, 73.0498), zoom: 15),
            //CameraPosition(target: LatLng(Lat, Long), zoom: 15),
        myLocationEnabled: true,
        tiltGesturesEnabled: false,
        compassEnabled: true,
        scrollGesturesEnabled: true,
        zoomGesturesEnabled: true,
        onMapCreated: (controller) {
          // _controller = controller;
        },
        markers: markers
      ),
    );
  }
}
