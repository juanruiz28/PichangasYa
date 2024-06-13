import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map2/app/domain/ui/pages/styles.dart';

class map1 extends StatefulWidget {
  const map1({Key? key}) : super(key: key);

  @override
  State<map1> createState() => _map1State();
}

class _map1State extends State<map1> {
  final _initialCameraPosition =
      CameraPosition(target: LatLng(-11.9647697, -77.0579471), zoom: 18.5);

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
            'Deport Center',
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
            position: LatLng(-11.9647697, -77.0579471),
            infoWindow: InfoWindow(title: 'Deport Center'),
          ),
        },
      ),
    );
  }
}
