import 'package:flutter/material.dart';

class ReservationPage extends StatefulWidget {
  const ReservationPage({Key? key}) : super(key: key);

  @override
  _ReservationPageState createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {
  late List<SportsCourt> filteredCourts;

  @override
  void initState() {
    super.initState();
    filteredCourts = List.from(availableSportsCourts);
  }

  List<SportsCourt> filterCourts(String keyword) {
    return availableSportsCourts
        .where((court) =>
            court.name.toLowerCase().startsWith(keyword.toLowerCase()) ||
            court.location.toLowerCase().startsWith(keyword.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Buscar Canchas Deportivas:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            TextField(
              onChanged: (value) {
                setState(() {
                  filteredCourts = filterCourts(value);
                });
              },
              decoration: const InputDecoration(
                hintText: 'Buscar canchas deportivas por nombre o ubicación',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(vertical: 12),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: filteredCourts.length,
                itemBuilder: (BuildContext context, int index) {
                  final court = filteredCourts[index];
                  return _buildCourtCard(context, court);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCourtCard(BuildContext context, SportsCourt court) {
    return GestureDetector(
      onTap: () {
        _showCourtDetailsDialog(context, court);
      },
      child: Card(
        elevation: 2,
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                court.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                court.location,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              Text(
                'Disponibilidad: ${court.availability}',
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showCourtDetailsDialog(BuildContext context, SportsCourt court) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            width: 300, // Ancho deseado para el AlertDialog
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Mostrar la imagen en la parte superior
                Container(
                  width: double.infinity,
                  height: 200,
                  child: Image.asset(
                    'assets/images/${court.imageName}',
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  court.name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text('Ubicación: ${court.location}'),
                const SizedBox(height: 8),
                Text('Disponibilidad: ${court.availability}'),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Lógica para la reserva
                        Navigator.of(context).pop();
                      },
                      child: Text('Reservar'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Cerrar'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class SportsCourt {
  final String name;
  final String location;
  final String availability;
  final String
      imageName; // Nueva propiedad para almacenar el nombre de la imagen

  SportsCourt({
    required this.name,
    required this.location,
    required this.availability,
    required this.imageName,
  });
}

// ...

final List<SportsCourt> availableSportsCourts = [
  SportsCourt(
    name: 'La caleta',
    location: 'Av. Tomas Marsano cuadra 48',
    availability: 'Disponible',
    imageName: 'cancha3.jpg', // Nombre de la imagen asociada a esta cancha
  ),
  SportsCourt(
    name: 'Entre Pelotas',
    location: 'Av. Los Frutales 561',
    availability: 'No disponible',
    imageName: 'cancha2.jpg',
  ),
  SportsCourt(
    name: 'Depor Center',
    location: 'Av. Jiron Antonio Cabo',
    availability: 'Disponible',
    imageName: 'cancha1.jpg',
  ),

  SportsCourt(
    name: 'Complejo costa verde',
    location: 'Av. Jiron Antonio Cabo',
    availability: 'Disponible',
    imageName: 'cancha4.jpg',
  ),

  SportsCourt(
    name: 'Complejo Pepe',
    location: 'Av. Jiron Antonio Cabo',
    availability: 'No disponible',
    imageName: 'cancha2.jpg',
  ),

  // Agrega más canchas según sea necesario
];
