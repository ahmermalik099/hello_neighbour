import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hello_neighbour/riverpod/markers.dart';
import 'package:hello_neighbour/services/fire_store.dart';
import 'package:http/http.dart' as http;
import 'package:marker_icon/marker_icon.dart';



class ExploreScreen extends ConsumerWidget {
  ExploreScreen({super.key});

  late GoogleMapController mapController;

  Set<Marker> markers = Set();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // only 1 time, when the widget is created
    var markers = ref.watch(markersProvider); // markers var is set of markers
    ref.read(markersProvider.notifier).getMarkers(context);
    log("Build method is called");
    log(markers.length.toString());
    log(markers.toString());

    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition:
                CameraPosition(target: LatLng(33.7077, 73.0498), zoom: 12),
            myLocationEnabled: true,
            tiltGesturesEnabled: false,
            compassEnabled: true,
            scrollGesturesEnabled: true,
            zoomGesturesEnabled: true,
            zoomControlsEnabled: false,
            onMapCreated: (controller) {
              // Access the map controller here.
              mapController = controller;
            },
            markers: markers,
          ),
          Positioned(
            top: 16,
            right: 16,
            child: Column(
              children: [
                FloatingActionButton(
                  heroTag: "zoomIn",
                  onPressed: () async {
                    var currentZoomLevel = await mapController.getZoomLevel();

                    currentZoomLevel = currentZoomLevel + 1;
                    mapController.animateCamera(
                      CameraUpdate.newCameraPosition(
                        CameraPosition(
                          target: LatLng(33.7077, 73.0498),
                          zoom: currentZoomLevel,
                        ),
                      ),
                    );
                  },
                  child: Icon(Icons.add),
                ),
                SizedBox(height: 8),
                FloatingActionButton(
                  heroTag: "zoomOut",
                  onPressed: () async {
                    var currentZoomLevel = await mapController.getZoomLevel();

                    currentZoomLevel = currentZoomLevel - 1;
                    mapController.animateCamera(
                      CameraUpdate.newCameraPosition(
                        CameraPosition(
                          target: LatLng(33.7077, 73.0498),
                          zoom: currentZoomLevel,
                        ),
                      ),
                    );
                  },
                  child: Icon(Icons.remove),
                ),
              FloatingActionButton(
                  heroTag: "Recall Markers",
                  onPressed: () async {
                    log("Recall Markers");
                    ref.read(markersProvider.notifier).getMarkers(context);
                  },
                  child: Icon(Icons.remove),
                ),
              
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Custom zoom buttons
