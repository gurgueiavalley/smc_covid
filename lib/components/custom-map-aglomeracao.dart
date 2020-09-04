import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:location/location.dart';
import 'package:smccovid/constants/constants.dart';
import 'package:smccovid/models/aglomeracao.dart';

class CustomMapAglomeracao extends StatefulWidget {
  @override
  _CustomMapAglomeracaoState createState() => _CustomMapAglomeracaoState();
}

class _CustomMapAglomeracaoState extends State<CustomMapAglomeracao> {
  List<Marker> marcacoes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<LocationData>(
        future: Location().getLocation(),
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            return FutureBuilder(
                future: hasuraConnect.query(Aglomeracao().listar()),
                builder: (context, d) {
                  if (d.hasData) {
                    print(d.data);
                    for (int i = 0;
                        i < d.data['data']['aglomeracoes'].length;
                        i++) {
                      marcacoes.add(
                        Marker(
                            icon: BitmapDescriptor.defaultMarkerWithHue(
                                BitmapDescriptor.hueViolet),
                            markerId: MarkerId(
                                "${d.data['data']['aglomeracoes'][i]['id_google']}"),
                            position: LatLng(
                                d.data['data']['aglomeracoes'][i]['latitude'],
                                d.data['data']['aglomeracoes'][i]['longitude']),
                            infoWindow: InfoWindow(
                              title:
                                  "${d.data['data']['aglomeracoes'][i]['descricao']}",
                            )),
                      );
                    }
                    return GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: LatLng(
                          snapshot.data.latitude,
                          snapshot.data.longitude,
                        ),
                        zoom: 15.0,
                      ),
                      mapType: MapType.normal,
                      markers: Set.from(marcacoes),
                      compassEnabled: true,
                      myLocationButtonEnabled: true,
                      myLocationEnabled: true,
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                });
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
