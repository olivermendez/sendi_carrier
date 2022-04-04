import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  final double startPositionLat;
  final double startPositionLong;
  final double endPositionLat;
  final double endPositionLong;

  const MapSample({
    Key? key,
    required this.startPositionLat,
    required this.startPositionLong,
    required this.endPositionLat,
    required this.endPositionLong,
  }) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();

  //final startPosition = [widget.startPositionLat, ]

  //static final CameraPosition _kGooglePlex = CameraPosition(
  //  target: LatLng(widget.startPositionLat, widget.startPositionLong),
  //  zoom: 14.4746,
  //);

  late CameraPosition _initialPosition;
  //late Marker _originMarker;
  //late Marker _destinationMarker;
  late Polyline _kPolyline;
  late Set<Marker> _markers = {};

  /*

  static final Marker _markers = Marker(
    markerId: MarkerId('_fromMarker'),
    infoWindow: InfoWindow(title: 'From Goole'),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(37.43296265331129, -122.085749655962),
  );

  */

  @override
  void initState() {
    super.initState();
    _initialPosition = CameraPosition(
      target: LatLng(
        widget.startPositionLat,
        widget.startPositionLong,
      ),
      zoom: 14.4746,
    );

    _markers = {
      Marker(
        markerId: const MarkerId('start'),
        position: LatLng(widget.startPositionLat, widget.startPositionLong),
        icon: BitmapDescriptor.defaultMarker,
      ),
      Marker(
          markerId: const MarkerId('end'),
          position: LatLng(widget.endPositionLat, widget.endPositionLong),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue))
    };

    _kPolyline = Polyline(
      polylineId: PolylineId('_kPolyline'),
      points: [
        LatLng(widget.startPositionLat, widget.startPositionLong),
        LatLng(widget.endPositionLat, widget.endPositionLong),
      ],
      width: 5,
    );
  }

  static const CameraPosition _kLake = CameraPosition(
    bearing: 192.8334901395799,
    target: LatLng(37.43296265331129, -122.08832357078792),
    tilt: 59.440717697143555,
    zoom: 19.151926040649414,
  );

  static final Polygon _kPolygon =
      Polygon(polygonId: PolygonId('_kPolygon'), points: [
    LatLng(37.42736133580664, -122.085749655962),
    LatLng(37.43296265331129, -122.08832357078792),
    LatLng(37.418, -122.092),
    LatLng(37.438, -122.092),
  ]);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        polylines: {_kPolyline},
        initialCameraPosition: _initialPosition,
        markers: _markers,
        onMapCreated: (GoogleMapController controller) {
          Future.delayed(const Duration(milliseconds: 2000), () {
            controller.animateCamera(CameraUpdate.newLatLngBounds(
                MapUtils.boundsFromLatLngList(
                  _markers.map((loc) => loc.position).toList(),
                ),
                1));
          });
          //_controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          print(widget.startPositionLat);
        },
        label: Text('To the lake!'),
        icon: Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}

class MapUtils {
  static LatLngBounds boundsFromLatLngList(List<LatLng> list) {
    double? x0, x1, y0, y1;
    for (LatLng latLng in list) {
      if (x0 == null) {
        x0 = x1 = latLng.latitude;
        y0 = y1 = latLng.longitude;
      } else {
        if (latLng.latitude > x1!) x1 = latLng.latitude;
        if (latLng.latitude < x0) x0 = latLng.latitude;
        if (latLng.longitude > y1!) y1 = latLng.longitude;
        if (latLng.longitude < y0!) y0 = latLng.longitude;
      }
    }
    return LatLngBounds(
        northeast: LatLng(x1! + 1, y1! + 1),
        southwest: LatLng(x0! - 1, y0! - 1));
  }
}
