import 'package:map2/app/domain/ui/pages/maps/map1.dart';
import 'package:map2/app/domain/ui/pages/maps/map2.dart';
import 'package:map2/app/domain/ui/pages/maps/map3.dart';
import 'package:map2/app/domain/ui/pages/maps/map4.dart';
import 'package:map2/app/domain/ui/pages/perfil.dart';
import 'package:map2/app/domain/ui/pages/reservation_page.dart';
import 'package:map2/app//domain/ui/pages/soporte.dart';
import 'package:map2/app/domain/ui/pages/styles.dart';
import 'package:flutter/material.dart';
import 'bottom_navigator_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _currentIndex == 1
          ? AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: kPrimaryColor,
              title: const Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Text(
                  'Reservar Canchas Deportivas',
                  style: kAppBarTextStyle,
                ),
              ),
              centerTitle: true,
            )
          : _currentIndex == 2
              ? AppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: kPrimaryColor,
                  title: const Padding(
                    padding: EdgeInsets.only(left: 16.0),
                    child: Text(
                      'Mi perfil',
                      style: kAppBarTextStyle, // Estilo de texto del appbar
                    ),
                  ),
                  centerTitle: true,
                )
              : _currentIndex == 3
                  ? AppBar(
                      automaticallyImplyLeading: false,
                      backgroundColor: kPrimaryColor,
                      title: const Padding(
                        padding: EdgeInsets.only(left: 16.0),
                        child: Text(
                          'Soporte Técnico',
                          style: kAppBarTextStyle, // Estilo de texto del appbar
                        ),
                      ),
                      centerTitle: true,
                    )
                  : AppBar(
                      automaticallyImplyLeading: false,
                      backgroundColor: kPrimaryColor,
                      title: const Text(
                        'Bienvenido a PichangasYa',
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
                  const TextField(
                    decoration: InputDecoration(
                      hintText: 'Buscar canchas deportivas',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                  const SizedBox(height: 16),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const map1()));
                    },
                    child: Container(
                      decoration: AppStyles.shadowedBoxDecoration,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/images/cancha1.jpg',
                          width: double.infinity,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Depor Center cuenta con tres complejo. '
                    'Uno en los Olivos(cruce de jirón Antonio Cabo y Tomás Catari)'
                    'y dos en Comas.(avenida el Maestro 380 y calle Casemiro)',
                    style: AppStyles.descriptionTextStyle,
                  ),
                  const Divider(),
                  const SizedBox(height: 16),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const map2()));
                    },
                    child: Container(
                      decoration: AppStyles.shadowedBoxDecoration,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/images/cancha2.jpg',
                          width: double.infinity,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Entre  pelotas, la Molina. Dirección: Av. Los Frutales'
                    '561, urb. Los Artesanos. ',
                    style: AppStyles.descriptionTextStyle,
                  ),
                  const Divider(),
                  const SizedBox(height: 16),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const map3()));
                    },
                    child: Container(
                      decoration: AppStyles.shadowedBoxDecoration,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/images/cancha3.jpg',
                          width: double.infinity,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Complejo Deportivo La Caleta, Surco.'
                    'Dirección: Av. Tomas Marsano cuadra 48 ',
                    style: AppStyles.descriptionTextStyle,
                  ),
                  const Divider(),
                  const SizedBox(height: 16),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const map4()));
                    },
                    child: Container(
                      decoration: AppStyles.shadowedBoxDecoration,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/images/cancha4.jpg',
                          width: double.infinity,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Complejo Costa Verde, Magdalena del Mar. Dirección:'
                    'Costa Verde. Para mayor informacion, acercarse '
                    'al coliseo Aldo Chamochumpi, Jiron Comandante Espinar.',
                    style: AppStyles.descriptionTextStyle,
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
}
