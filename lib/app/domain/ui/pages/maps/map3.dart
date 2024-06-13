import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map2/app/domain/ui/pages/styles.dart';

class map3 extends StatefulWidget {
  const map3({Key? key}) : super(key: key);

  @override
  State<map3> createState() => _map3State();
}

class _map3State extends State<map3> {
  final _initialCameraPosition =
      CameraPosition(target: LatLng(-12.1496797, -76.9911652), zoom: 18.5);

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
          padding: EdgeInsets.only(left: 0),
          child: Text(
            'Complejo Deportivo: La caleta',
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
            position: LatLng(-12.1496797, -76.9911652),
            infoWindow: InfoWindow(title: 'Complejo Deportivo: La caleta'),
          ),
        },
      ),
    );
  }
}
