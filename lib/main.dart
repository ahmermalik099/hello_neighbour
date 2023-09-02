import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(target: LatLng(33.7077, 73.0498), zoom: 15),
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

        },
      )
    }
      ),


    );
  }
}
