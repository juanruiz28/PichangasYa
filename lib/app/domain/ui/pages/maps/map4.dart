import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map2/app/domain/ui/pages/styles.dart';

class map4 extends StatefulWidget {
  const map4({Key? key}) : super(key: key);

  @override
  State<map4> createState() => _map4State();
}

class _map4State extends State<map4> {
  final _initialCameraPosition =
      CameraPosition(target: LatLng(-12.1053037, -77.0630123), zoom: 18.5);

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
            'Complejo costa verde',
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
            position: LatLng(-12.1053037, -77.0630123),
            infoWindow: InfoWindow(title: 'Complejo costa verde'),
          ),
        },
      ),
    );
  }
}
