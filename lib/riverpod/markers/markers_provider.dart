import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hello_neighbour/riverpod/markers/markers_state.dart';

final markersProvider =
    StateNotifierProvider<MyCustomMarkers, Set<Marker>>((ref) {
  return MyCustomMarkers();
});
