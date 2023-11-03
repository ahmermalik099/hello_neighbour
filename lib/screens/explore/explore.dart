import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hello_neighbour/riverpod/markers/markers_provider.dart';
import 'package:hello_neighbour/riverpod/refresh/refresh_provider.dart';
import 'package:hello_neighbour/screens/explore/components/bottomsheet.dart';

class ExploreScreen extends ConsumerWidget {
  ExploreScreen({super.key});

  late GoogleMapController mapController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // var refresh = ref.watch(refreshProvider);
    // log("refresh: $refresh");
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder<Set<Marker>>(
            future: ref.read(markersProvider.notifier).getMarkers(context),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child:
                      CircularProgressIndicator(), // Show a loading indicator.
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(
                      'Error: ${snapshot.error}'), // Handle the error state.
                );
              } else {
                final markers = snapshot.data!;
                log("Marker fethced in future builder: ${markers.length}");

                return GoogleMap(
                  initialCameraPosition: CameraPosition(
                      target: LatLng(33.7077, 73.0498), zoom: 12),
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
                );
              }
            },
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
                SizedBox(height: 8),
                FloatingActionButton(
                  heroTag: "Recall Markers",
                  onPressed: () async {
                    log("Recall Markers");
                    ref.read(refreshProvider.notifier).refresh();
                  },
                  child: Icon(Icons.refresh),
                ),
              ],
            ),
          ),
        
          BottomSheetUser(),
        
        ],
      ),
    );
  }
}

// Custom zoom buttons
