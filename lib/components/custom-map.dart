import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapCustom extends StatefulWidget {
  @override
  _MapCustomState createState() => _MapCustomState();
}

class _MapCustomState extends State<MapCustom> {
  Completer<GoogleMapController> _controller = Completer();

List<Marker> _marcar = [];

void addMarcacao(){
  
}

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<LocationData>(
      stream: Location().onLocationChanged,
      builder: (context, snapshot) {
        if (snapshot.hasData &&
            snapshot.data.latitude != null &&
            snapshot.data.longitude != null) {
          return GoogleMap(
            initialCameraPosition: CameraPosition(
                target: LatLng(snapshot.data.latitude, snapshot.data.longitude),
                zoom: 13.0),
            mapType: MapType.normal,
            compassEnabled: true,
            buildingsEnabled: true,
            indoorViewEnabled: true,
            mapToolbarEnabled: true,
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
            rotateGesturesEnabled: true,
            scrollGesturesEnabled: true,
            tiltGesturesEnabled: true,
            trafficEnabled: true,

            markers: Set.from(
              [
                Marker(
                  infoWindow: InfoWindow(
                    title: "id: ",
                    snippet: "Latitude - Longitude"
                  ),
                  markerId: MarkerId("1"),
                  position: LatLng(snapshot.data.latitude, snapshot.data.longitude)
                )
              ]
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
