import 'package:flutter/material.dart';
import '../utlities/app_theme.dart';
import '../widgets/character_widget.dart';

class CharacterListScreen extends StatefulWidget {
  _CharacterListScreenState createState() => _CharacterListScreenState();
}

class _CharacterListScreenState extends State<CharacterListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.arrow_back_ios),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 15),
              child: Icon(Icons.search),
            ),
          ],
        ),
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.only(bottom: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 32, top: 8),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: "Despicale Me",
                          style: UtlitesTextStyle.display1),
                      TextSpan(text: "\n"),
                      TextSpan(
                          text: "Characters", style: UtlitesTextStyle.display2)
                    ],
                  ),
                ),
              ),
              Expanded(
                child: CharacterWidget(),
              ),
            ],
          ),
        )));
  }
}
