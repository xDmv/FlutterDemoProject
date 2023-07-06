import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapboxPage extends StatefulWidget {
  const MapboxPage({super.key});

  @override
  _MapboxPageState createState() => _MapboxPageState();
}

class _MapboxPageState extends State<MapboxPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;


  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Stack(
      children: [
        Positioned.fill(
          child: FlutterMap(
            options: MapOptions(
              minZoom: 5,
              maxZoom: 18,
              zoom: 13,
              center: LatLng(50.444798, 30.521361),
            ),
            children: [
              TileLayer(
                urlTemplate:
                "https://api.mapbox.com/styles/v1/{userId}/{mapStyleId}/tiles/256/{z}/{x}/{y}@2x?access_token={accessToken}",
                additionalOptions: {
                  'userId':'mak-dv',
                  'mapStyleId': 'clizp570801bl01pf80zpgrbb',
                  'accessToken': 'pk.eyJ1IjoibWFrLWR2IiwiYSI6ImNsaXk4MjhxMzA1YzMzZXM5NXNkdzdpdnYifQ.NmrPjgWwYu-fhQb7eQCb1w',
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

}
