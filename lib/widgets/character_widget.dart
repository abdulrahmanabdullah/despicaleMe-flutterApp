import 'package:flutter/material.dart';
import '../model/characters_model.dart';
import '../utlities/app_theme.dart';
import '../screens/characters_details.dart';

class CharacterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        _moveToDetails(context);
      },
      child: Stack(
        children: [
          _backgroundColorWidget(screenHeight, screenWidth),
          _setMiniosnImage(screenHeight),
          _characterName(),
        ],
      ),
    );
  }

  // Draw back ground color
  Widget _backgroundColorWidget(double height, double width) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: ClipPath(
        clipper: CharacterClipPathBackground(),
        child: Container(
          height: height * 0.6,
          width: 0.9 * width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: characters[0].color,
            begin: Alignment.topRight,
            end: Alignment.bottomCenter,
          )),
        ),
      ),
    );
  }

  //Set miniosn image
  Widget _setMiniosnImage(double height) {
    return Align(
        alignment: Alignment(0, -0.55),
        child: Hero(
          tag: "Image1",
          child: Material(
            color: Colors.transparent,
            child: Container(
              child: Image.asset(
                characters[0].imagePath,
                height: height * 0.55,
              ),
            ),
          ),
        ));
  }

  // set name and content under image.
  Widget _characterName() {
    return Padding(
      padding: EdgeInsets.only(left: 48, right: 16, bottom: 8),
      child: Column(
        // horizontal
        crossAxisAlignment: CrossAxisAlignment.start,
        // vertical
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Hero(
            tag: "name1",
            child: Material(
              color: Colors.transparent,
              child: Container(
                child: Text(
                  characters[0].name,
                  style: UtlitesTextStyle.heading,
                ),
              ),
            ),
          ),
          Hero(
            tag: "des1",
            child: Material(
              color: Colors.transparent,
              child: Container(
                child: Text(
                  "Tap to read more",
                  style: UtlitesTextStyle.subHeading,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  //Navigation to details screen
  void _moveToDetails(context) {
    Navigator.push(
        context,
        PageRouteBuilder(
            transitionDuration: Duration(microseconds: 30),
            pageBuilder: (context, _, __) => CharactersDetails(
                  charater: characters[0],
                )));
  }
}

//Shape curved box ..
class CharacterClipPathBackground extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double curedDistance = 40;
    // Left
    path.moveTo(0, size.height * 0.4);
    path.lineTo(0, size.height - curedDistance);
    path.quadraticBezierTo(1, size.height - 1, 0 + curedDistance, size.height);
    // Bottom
    path.lineTo(size.width - curedDistance, size.height);
    path.quadraticBezierTo(size.width + 1, size.height - 1, size.width,
        size.height - curedDistance);
    // Right
    path.lineTo(size.width, 0 + curedDistance);
    path.quadraticBezierTo(size.width - 1, 0, size.width - curedDistance - 5,
        0 + curedDistance / 3);
    // Top
    path.lineTo(curedDistance, size.height * 0.29);
    path.quadraticBezierTo(1, (size.height * 0.30) + 10, 0, size.height * 0.4);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
