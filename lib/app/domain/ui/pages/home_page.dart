import 'package:flutter/material.dart';
import 'package:map2/app/domain/ui/pages/maps/map1.dart';
import 'package:map2/app/domain/ui/pages/maps/map2.dart';
import 'package:map2/app/domain/ui/pages/maps/map3.dart';
import 'package:map2/app/domain/ui/pages/maps/map4.dart';
import 'package:map2/app/domain/ui/pages/perfil.dart';
import 'package:map2/app/domain/ui/pages/reservation_page.dart';
import 'package:map2/app/domain/ui/pages/soporte.dart';
import 'package:map2/app/domain/ui/pages/styles.dart';
import 'bottom_navigator_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  String searchQuery = '';
  String selectedType = 'Todas';
  bool isGridView = false;

  List<Map<String, dynamic>> canchas = [
    {
      'name': 'Depor Center Los Olivos',
      'type': 'Sintético',
      'image': 'assets/images/cancha1.jpg',
      'description':
          'Complejo deportivo con canchas de fútbol de césped sintético. Localizado en los Olivos, cuenta con amplias instalaciones y servicios como vestuarios, estacionamiento y cafetería.',
      'map': 'map1'
    },
    {
      'name': 'Entre Pelotas La Molina',
      'type': 'Natural',
      'image': 'assets/images/cancha2.jpg',
      'description':
          'Ubicado en La Molina, este complejo ofrece canchas de fútbol con césped natural. Ideal para equipos y jugadores que prefieren jugar en superficies naturales.',
      'map': 'map2'
    },
    {
      'name': 'Complejo Deportivo La Caleta',
      'type': 'Loza de Cemento',
      'image': 'assets/images/cancha5.jpg',
      'description':
          'Instalaciones de fútbol en loza de cemento ubicadas en Surco. Este complejo es conocido por su ambiente familiar y accesibilidad. Ofrece múltiples canchas para partidos y entrenamientos.',
      'map': 'map3'
    },
    {
      'name': 'Complejo Costa Verde',
      'type': 'Sintético',
      'image': 'assets/images/cancha4.jpg',
      'description':
          'Situado en Magdalena del Mar, este complejo cuenta con canchas de fútbol de césped sintético con vista al mar. Es popular entre los aficionados al fútbol por su ubicación y comodidades.',
      'map': 'map4'
    },
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void toggleView() {
    setState(() {
      isGridView = !isGridView;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredCanchas = canchas.where((cancha) {
      return (selectedType == 'Todas' || cancha['type'] == selectedType) &&
          cancha['name'].toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
        title: Text(
          _currentIndex == 1
              ? 'Reservar Canchas Deportivas'
              : _currentIndex == 2
                  ? 'Mi perfil'
                  : _currentIndex == 3
                      ? 'Soporte Técnico'
                      : 'Bienvenido a PichangasYa',
          style: kAppBarTextStyle,
        ),
        centerTitle: true,
      ),
      body: _currentIndex == 0
          ? SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Canchas deportivas cercanas:',
                    style: AppStyles.headlineTextStyle,
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Buscar canchas deportivas',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(vertical: 12),
                    ),
                    onChanged: (query) {
                      setState(() {
                        searchQuery = query;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DropdownButton<String>(
                        value: selectedType,
                        onChanged: (newValue) {
                          setState(() {
                            selectedType = newValue!;
                          });
                        },
                        items: <String>[
                          'Todas',
                          'Sintético',
                          'Natural',
                          'Loza de Cemento'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                      IconButton(
                        onPressed: toggleView,
                        icon: Icon(
                          isGridView ? Icons.view_list : Icons.grid_view,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  isGridView
                      ? GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16.0,
                            mainAxisSpacing: 16.0,
                            childAspectRatio: 0.75,
                          ),
                          itemCount: filteredCanchas.length,
                          itemBuilder: (context, index) {
                            return buildListItem(filteredCanchas[index]);
                          },
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: filteredCanchas.length,
                          itemBuilder: (context, index) {
                            return buildListItem(filteredCanchas[index]);
                          },
                        ),
                ],
              ),
            )
          : _currentIndex == 1
              ? const ReservationPage()
              : _currentIndex == 2
                  ? const PerfilPage()
                  : const SoportePage(),
      bottomNavigationBar: BottomNavigationBarWidget(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget buildListItem(Map<String, dynamic> cancha) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.0),
                  topRight: Radius.circular(12.0),
                ),
                child: Image.asset(
                  cancha['image'],
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8.0,
                right: 8.0,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => getPage(cancha['map'])),
                    );
                  },
                  mini: true,
                  child: Icon(Icons.location_on),
                  backgroundColor: Colors.blue,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cancha['name'],
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.0),
                Text(
                  cancha['type'],
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  cancha['description'],
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey[600],
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getPage(String map) {
    switch (map) {
      case 'map1':
        return const map1();
      case 'map2':
        return const map2();
      case 'map3':
        return const map3();
      case 'map4':
        return const map4();
      default:
        return const map1();
    }
  }
}
