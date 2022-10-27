import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:greatplaces/models/place.dart';

class MapScreen extends StatefulWidget {
  final PlaceLocation initialLocation;
  final bool isReadOnly;

  const MapScreen(
      {this.isReadOnly = false,
      this.initialLocation = const PlaceLocation(
          latitude: 37.419857, longitude: -122.078827, address: ''),
      super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late LatLng _pickedPosition;

  void _selectPosition(LatLng position) {
    _pickedPosition = position;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selecione'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pop(_pickedPosition);
              },
              icon: Icon(Icons.check))
        ],
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
            target: LatLng(widget.initialLocation.latitude,
                widget.initialLocation.longitude),
            zoom: 13),
        onTap: widget.isReadOnly ? null : _selectPosition,
        markers: {
          Marker(
            markerId: MarkerId('p1'),
            position: _pickedPosition,
          )
        },
      ),
    );
  }
}
