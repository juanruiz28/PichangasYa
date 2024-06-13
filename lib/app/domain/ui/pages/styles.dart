import 'package:flutter/material.dart';

class AppStyles {
  static const TextStyle headlineTextStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const TextStyle descriptionTextStyle = TextStyle(
    fontSize: 16,
    color: Colors.black,
  );

  static BoxDecoration shadowedBoxDecoration = BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        spreadRadius: 5,
        blurRadius: 10,
        offset: const Offset(0, 3),
      ),
    ],
  );
}

const kPrimaryColor = Color.fromARGB(255, 138, 219, 6);
const kAccentColor = Color(0xFFFF4081);
const kBackgroundColor = Color(0xFFF5F5F5);
const kTextColor = Color(0xFF333333);

const kTitleTextStyle = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.bold,
  color: kPrimaryColor,
);

const kSubtitleTextStyle = TextStyle(
  fontSize: 18,
  color: kPrimaryColor,
);

const kButtonTextStyle = TextStyle(
  fontSize: 18,
  color: Colors.white,
);

const kDescriptionTextStyle = TextStyle(
  fontSize: 16,
  color: kTextColor,
);

const kAppBarTextStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
);

const kBottomNavigationBarTextStyle = TextStyle(
  fontSize: 14,
);
