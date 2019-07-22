import 'package:flutter/material.dart';
import './screens/character_list_screen.dart';
import './model/characters_model.dart';
import './screens/characters_details.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Character character;

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
      title: "Practice",
//      home:CharacterListScreen(),
      routes: {
        "/": (context) => CharacterListScreen(character),
      },
    );
  }
}
