import 'package:flutter/material.dart';
import '../utlities/app_theme.dart';
import '../widgets/character_widget.dart';
import '../model/characters_model.dart';

class CharacterListScreen extends StatefulWidget {
  _CharacterListScreenState createState() => _CharacterListScreenState();
}

class _CharacterListScreenState extends State<CharacterListScreen> {
  //ViewPager
  PageController _pageController;

  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
        viewportFraction: 1.0, initialPage: currentPage, keepPage: false);
  }

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
//                child: CharacterWidget(),
                child: PageView(
                  controller: _pageController,
                  children: _createCharacterWidget(characters.length),
                ),
              ),
            ],
          ),
        )));
  }

  List<Widget> _createCharacterWidget(int length) {
    List<Widget> characterWidgets = [];
    for(var i = 0 ; i < length ;i++){
      characterWidgets.add(CharacterWidget(character: characters[i],));
    }
    return characterWidgets;
  }
}
