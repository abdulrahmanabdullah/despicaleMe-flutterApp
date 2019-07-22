import 'package:flutter/material.dart';
class UtlitesTextStyle {

  static const TextStyle display1 = TextStyle(
      fontFamily: 'WorkSans',
      color: Colors.black,
      fontSize: 30,
      fontWeight: FontWeight.w600,
      letterSpacing: 3.2);
  static const TextStyle display2 = TextStyle(
      fontFamily: 'WorkSans',
      color: Colors.black,
      fontSize: 32,
      fontWeight: FontWeight.normal,
      letterSpacing: 1.1);
  static final TextStyle heading = TextStyle(
      fontFamily: 'WorkSans',
      color: Colors.white.withOpacity(0.8),
      fontSize: 34,
      fontWeight: FontWeight.w900,
      letterSpacing: 1.2);
  static final TextStyle subHeading = TextStyle(
    inherit: true,
    fontFamily: 'WorkSans',
    color: Colors.white.withOpacity(0.8),
    fontSize: 34,
    fontWeight: FontWeight.w500,
  );
}
