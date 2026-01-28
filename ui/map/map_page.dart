import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(15.3694, 44.1910); // صنعاء

  final Set<Marker> _markers = {
    const Marker(
      markerId: MarkerId('shop1'),
      position: LatLng(15.3710, 44.1930),
      infoWindow: InfoWindow(
        title: 'متجر اليمن',
        snippet: 'مواد غذائية',
      ),
    ),
    const Marker(
      markerId: MarkerId('shop2'),
      position: LatLng(15.3680, 44.1890),
      infoWindow: InfoWindow(
        title: 'سوق التقنية',
        snippet: 'إلكترونيات',
      ),
    ),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        title: const Text('الخريطة'),
        backgroundColor: const Color(0xFF0F172A),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 14.0,
        ),
        markers: _markers,
        onMapCreated: (controller) {
          mapController = controller;
        },
        myLocationButtonEnabled: true,
        zoomControlsEnabled: false,
      ),
    );
  }
}
