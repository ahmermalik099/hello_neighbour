import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hello_neighbour/services/fire_store.dart';
import 'package:http/http.dart' as http;

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

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  void prepareMarkers() async {
    // fetch all users from firebase
    log('heyyyyyyyyyyyyyyyyyyyyyy');

    List<dynamic> users = await FirestoreService().getUsers();
    log('heyyyyyyyyyyyyyyyyyyyyyy');
    log(users.length.toString());
    users.forEach((element) async {
      // add marker for each user

      log(users.length.toString());

      log(element.toString());
      var iconurl = element['pfp_url'] ??
          "https://firebasestorage.googleapis.com/v0/b/flutterlogin-db068.appspot.com/o/pfp%2FqH46YSrLWJN4tbXBiE9WQa7L2of2?alt=media&token=1148adf5-b54e-4936-a48c-8680d87d7d15";
      // var dataBytes;
      // var request = await http.get(iconurl);
      // var bytes = await request.bodyBytes;
      final response = await HttpClient().getUrl(Uri.parse(iconurl));
      final bytes = await response.close().then((response) =>
          response.fold<Uint8List>(Uint8List(0),
              (previous, current) => Uint8List.fromList(previous + current)));

      markerbitmap =
          await BitmapDescriptor.fromBytes(bytes, size: const Size(52, 52));
      // log(dataBytes.toString()  );

      markers.add(Marker(
        //add start location marker
        markerId: MarkerId(element['userName'] ?? ''),
        position: LatLng(double.parse(element['lat'] ?? 33.7077),
            double.parse(element['long'] ?? 73.0498)), //posi\ion of marker
        infoWindow: InfoWindow(
            //popup info
            title: element['userName'] ?? '',
            snippet: 'Click for details',
            onTap: () {
              // static profile screen
              Navigator.pushNamed(context, '/chat');
            }),
        icon: markerbitmap, //Icon for Marker
      ));
    });

    setState(() {});
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
          markers: markers),
    );
  }
}
