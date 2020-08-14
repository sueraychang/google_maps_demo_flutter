import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(MyApp());
}

final ThemeData kIOSTheme = ThemeData(
  primarySwatch: Colors.orange,
  primaryColor: Colors.grey[100],
  primaryColorBrightness: Brightness.light,
);

final ThemeData kDefaultTheme = ThemeData(
  primarySwatch: Colors.purple,
  accentColor: Colors.orangeAccent[400],
);

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  LatLng _location;
  CameraPosition _cameraPosition;
  GoogleMapController _mapController;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: defaultTargetPlatform == TargetPlatform.iOS
          ? kIOSTheme
          : kDefaultTheme,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Where am I'),
          elevation:
              Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition:
              CameraPosition(target: LatLng(25.033671, 121.564427), zoom: 17.0),
          myLocationButtonEnabled: true,
          myLocationEnabled: true,
        ),
      ),
    );
  }

  Future getCurrentLocation() async {
    var position = await Geolocator()
        .getLastKnownPosition(desiredAccuracy: LocationAccuracy.high);
    debugPrint('getLastKnownPosition $position');

    setState(() {
      _location = LatLng(position.latitude, position.longitude);
      _cameraPosition = CameraPosition(target: _location, zoom: 17.0);
      _mapController
          .animateCamera(CameraUpdate.newCameraPosition(_cameraPosition));
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    debugPrint('onMapCreated');
    _mapController = controller;
    getCurrentLocation();
  }
}
