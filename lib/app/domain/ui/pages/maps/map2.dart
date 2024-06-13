import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map2/app/domain/ui/pages/styles.dart';

class map2 extends StatefulWidget {
  const map2({Key? key}) : super(key: key);

  @override
  State<map2> createState() => _map2State();
}

class _map2State extends State<map2> {
  final _initialCameraPosition =
      CameraPosition(target: LatLng(-12.0622451, -76.9653373), zoom: 18.5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back)),
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
        title: const Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: Text(
            'Entre pelotas',
            style: kAppBarTextStyle,
          ),
        ),
        centerTitle: true,
      ),
      body: GoogleMap(
        // onMapCreated: (GoogleMapController controller),
        initialCameraPosition: _initialCameraPosition,
        myLocationButtonEnabled: true, //Locacion actual
        // scrollGesturesEnabled: true, //Mover el mapa
        // zoomGesturesEnabled: false, //Para hacer zoom
        // zoomControlsEnabled: true, // Botones de zoom
        // mapType: MapType.normal, // Tipo de mapa
        // onTap: (position) {
        //   print(position);
        // },
        compassEnabled: false, //eliminar compas
        markers: {
          Marker(
            markerId: MarkerId('marker_1'),
            position: LatLng(-12.0622451, -76.9653373),
            infoWindow: InfoWindow(title: 'Entre pelotas'),
          ),
        },
      ),
    );
  }
}
