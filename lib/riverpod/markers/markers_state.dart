import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hello_neighbour/models/user.dart';
import 'package:hello_neighbour/riverpod/bottomsheet/bottomsheet_state.dart';
import 'package:hello_neighbour/riverpod/markers/markers_provider.dart';
import 'package:hello_neighbour/services/fire_store.dart';
import 'package:marker_icon/marker_icon.dart';

class MyCustomMarkers extends StateNotifier<Set<Marker>> {
  BottomSheetUserState bottomSheetUser;

  MyCustomMarkers(this.bottomSheetUser) : super(Set());

  Future<Set<Marker>> getMarkers(BuildContext context) async {
  try {
    log('fetching markers');
    List<MyUser> users = await FirestoreService().getUsers();
    log('markers fetched ${users.length}');
    List<Future<Marker>> markerFutures = [];

    users.forEach((user) {
      
      Future<Marker> markerFuture = () async {
        BitmapDescriptor markerUser = await MarkerIcon.downloadResizePictureCircle(
            user?.pfp_url ??
                "https://i0.wp.com/thegeekiary.com/wp-content/uploads/2022/12/bleach-blades.jpg?resize=620%2C435&ssl=1",
            size: 175,
            addBorder: true,
            borderColor: Colors.white,
            borderSize: 24);

        return Marker(
          markerId: MarkerId(
            user?.userName ?? '',
          ),
          position: LatLng(
            double.parse(user.lat ?? '33.7077' as String),
            double.parse(user.long ?? '73.0498' as String),
          ),
          icon: markerUser,
          onTap: () {
            log("user: $user");
            bottomSheetUser.setUser(user);
          },
        );
      }();

      markerFutures.add(markerFuture);
    });

    // Wait for all the markerFutures to complete.
    List<Marker> markers = await Future.wait(markerFutures);
    
    state = markers.toSet();
  } catch (e) {
    log(e.toString());
  }

  log(state.length.toString());
  return state;
}


  void emptyMarkers() {
    state = {};
  }
}
