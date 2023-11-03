import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hello_neighbour/services/fire_store.dart';
import 'package:marker_icon/marker_icon.dart';

class MyCustomMarkers extends StateNotifier<Set<Marker>> {
  MyCustomMarkers() : super(Set());

  Future<Set<Marker>> getMarkers(BuildContext context) async {
    List<dynamic> users = await FirestoreService().getUsers();

    users.forEach((user) async {
      BitmapDescriptor markerUser = await MarkerIcon.downloadResizePictureCircle(
          user!['pfp_url'] ??
              "https://i0.wp.com/thegeekiary.com/wp-content/uploads/2022/12/bleach-blades.jpg?resize=620%2C435&ssl=1",
          size: 175,
          addBorder: true,
          borderColor: Colors.white,
          borderSize: 24);
      state.add(
        Marker(
          markerId: MarkerId(
            user['userName'] ?? '',
          ),
          position: LatLng(
            double.parse(user['lat'] ?? 33.7077),
            double.parse(user['long'] ?? 73.0498),
          ),
          icon: markerUser,
          onTap: () {
            Navigator.pushNamed(context, '/userDetails', arguments: user);
            // // riverpod state for a modal bottom sheet
          },
        ),
      );
    });

    return state;
  }

  void emptyMarkers() {
    state = {};
  }
}
