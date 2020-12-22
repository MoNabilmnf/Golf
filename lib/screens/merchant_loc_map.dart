import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MerchantLocMap extends StatefulWidget {
  static const ROUTE_NAME = '/merchantLocMap';

  @override
  _MerchantLocMapState createState() => _MerchantLocMapState();
}

class _MerchantLocMapState extends State<MerchantLocMap> {
  GoogleMapController mapController;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    final locationArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    return Scaffold(
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        compassEnabled: true,
        mapToolbarEnabled: true,
        markers: Set<Marker>.of(
          [
            Marker(
              markerId: MarkerId(locationArgs['id'].toString()),
              position: LatLng(
                locationArgs['lat'],
                locationArgs['lon'],
              ),
              infoWindow: InfoWindow(
                title: locationArgs['title'],
              ),
            ),
          ],
        ),
        initialCameraPosition: CameraPosition(
          target: LatLng(
            locationArgs['lat'],
            locationArgs['lon'],
          ),
          zoom: 18.0,
        ),
      ),
    );
  }
}
