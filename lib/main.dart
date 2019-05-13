import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'utils/core.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Uber clone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Uber clone'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Map()
    );
  }
}

class Map extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  GoogleMapController mapController;
  static const _initialPosition = LatLng(33.596604,-7.638373);
  LatLng _lastPosition = _initialPosition;
  final Set<Marker> _marker = {};

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        GoogleMap(
          initialCameraPosition: CameraPosition(target: _initialPosition, zoom: 15),
          onMapCreated: onCreated,
          myLocationEnabled: true,
          mapType: MapType.normal,
          markers: _marker,
          onCameraMove: onCameraMove,
        ),

        Positioned(
          top: 40,
          right: 10,
          child: FloatingActionButton(onPressed: _onAddMarkerPressed,
            tooltip: "Add Marker",
            backgroundColor: black,
            child: Icon(Icons.add_location, color: white),
          ),
        )
      ],
    );
  }

  void onCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }

  void onCameraMove(CameraPosition position) {
    _lastPosition = position.target;
  }

  void _onAddMarkerPressed() {
    setState(() {
      _marker.add(Marker(markerId: MarkerId(_lastPosition.toString()),
          position: _lastPosition,
          infoWindow: InfoWindow(
              title: "remember here",
              snippet: "good place"
          ),
          icon: BitmapDescriptor.defaultMarker
      ));
    });
  }
}












