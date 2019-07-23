import 'package:flutter/material.dart';
import './screens/character_list_screen.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.white,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0,
        ),
        canvasColor: Colors.white,
      ),
      title: "DespicaleMe App",
//      home:CharacterListScreen(),
      routes: {
        "/": (context) => CharacterListScreen(),
      },
    );
  }
}
