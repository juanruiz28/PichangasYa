import 'package:flutter/material.dart';
import 'styles.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavigationBarWidget({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home, color: kPrimaryColor),
          label: 'Inicio',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today, color: kPrimaryColor),
          label: 'Reserva',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person, color: kPrimaryColor),
          label: 'Perfil',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.headset_mic, color: kPrimaryColor),
          label: 'Soporte',
        ),
      ],
      currentIndex: currentIndex,
      selectedItemColor: kPrimaryColor,
      unselectedItemColor: kTextColor,
      selectedLabelStyle: kBottomNavigationBarTextStyle,
      unselectedLabelStyle: kBottomNavigationBarTextStyle,
      onTap: onTap,
    );
  }
}
