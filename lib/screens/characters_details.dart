import 'package:flutter/material.dart';
import '../model/characters_model.dart';
import '../utlities/app_theme.dart';

class CharactersDetails extends StatefulWidget {
  final Character charater;

  CharactersDetails({Key key, this.charater}) : super(key: key);

  @override
  _CharactersDetailsState createState() => _CharactersDetailsState();
}

class _CharactersDetailsState extends State<CharactersDetails> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: InkWell(
        onTap: () {
          _closePageEventListener();
        },
        child: Stack(fit: StackFit.expand, children: <Widget>[
          DecoratedBox(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: widget.charater.color,
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            )),
          ),
          _layoutPage(screenHeight),
        ]),
      ),
    );
  }

  //  set close icon in column.
  Widget _closeIcon() {
    return Padding(
      padding: EdgeInsets.only(top: 8, left: 16),
      child: IconButton(
        iconSize: 40,
        icon: Icon(
          Icons.close,
          color: Colors.white.withOpacity(0.9),
        ),
        onPressed: () {
          _closePageEventListener();
        },
      ),
    );
  }

  // event for click close button
  void _closePageEventListener() {
    Navigator.pop(context);
  }

  //every thing inside this page is here ..
  Widget _layoutPage(height) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 40,
          ),
          _closeIcon(),
          _uploadImage(height),
          _getName(),
          _getDescription(),
        ],
      ),
    );
  }

  // get image
  Widget _uploadImage(double height) {
    return Align(
      alignment: Alignment.topRight,
      child: Hero(
          tag: "Image1",
          child: Material(
              color: Colors.transparent,
              child: Container(
                child: Image.asset(widget.charater.imagePath,
                    height: height * 0.45),
              ))),
    );
  }

  // get name
  Widget _getName() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
      child: Hero(
        tag: "name1",
        child: Material(
          color: Colors.transparent,
          child: Container(
            child: Text(
              widget.charater.name,
              style: UtlitesTextStyle.heading,
            ),
          ),
        ),
      ),
    );
  }

// get description
  Widget _getDescription() {
    return Padding(
      padding: EdgeInsets.fromLTRB(32, 0, 8, 32),
      child: Hero(
        tag: "des1",
        child: Material(
          color: Colors.transparent,
          child: Container(
            child: Text(
              widget.charater.description,
              style: UtlitesTextStyle.subHeading,
            ),
          ),
        ),
      ),
    );
  }
}
