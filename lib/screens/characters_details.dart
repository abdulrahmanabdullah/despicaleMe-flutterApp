import 'package:flutter/material.dart';
import 'package:after_layout/after_layout.dart';
import '../model/characters_model.dart';
import '../utlities/app_theme.dart';

class CharactersDetails extends StatefulWidget {
  final Character charater;

  // just hide colors in clips without clips word .
  final double _collapsedBottomSheetBottom = -250;

  // to show colors in clips
  final double _exapendBottomSheetBottom = 0;

  // to hidden clips completely
  // this value become like 330 because container height = 80 and clips = 250 then 80 + 250 = 330
  final double _completeCollapsedBottomSheet = -330;

  CharactersDetails({Key key, this.charater}) : super(key: key);

  @override
  _CharactersDetailsState createState() => _CharactersDetailsState();
}

class _CharactersDetailsState extends State<CharactersDetails>
    with AfterLayoutMixin<CharactersDetails> {
  double _currentBottomSheetPosition = -330;

  bool isCollpased = false;

  List<Color> currentColor;

  @override
  void initState() {
    super.initState();
    currentColor = List.from(widget.charater.color);
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(fit: StackFit.expand, children: <Widget>[
        DecoratedBox(
          decoration: BoxDecoration(
            color: currentColor.last,
              gradient: LinearGradient(
            colors: currentColor,
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          )),
        ),
        _layoutPage(screenHeight),
        AnimatedPositioned(
          duration: Duration(milliseconds: 500),
          curve: Curves.bounceOut,
          bottom: _currentBottomSheetPosition,
          left: 0,
          right: 0,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                InkWell(
                  onTap: _closeClipsColors,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 32),
                    height: 80,
                    child: Text(
                      "Clips",
                      style: UtlitesTextStyle.subHeading
                          .copyWith(color: Colors.black),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: _clpisWidget(),
                ),
              ],
            ),
          ),
        ),
      ]),
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

  Widget _clpisWidget() {
    return Container(
      height: 250,
      margin: EdgeInsets.symmetric(horizontal: 16),
      //First Row
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              _fillClipsColor(Colors.deepOrange),
              SizedBox(height: 20),
              _fillClipsColor(Colors.orange),
            ],
          ),
          SizedBox(
            width: 12,
          ),
          Column(
            children: <Widget>[
              _fillClipsColor(Colors.redAccent),
              SizedBox(height: 20),
              _fillClipsColor(Colors.deepPurple),
            ],
          ),
          SizedBox(
            width: 12,
          ),
          Column(
            children: <Widget>[
              _fillClipsColor(Colors.blue),
              SizedBox(height: 20),
              _fillClipsColor(Colors.lightBlue),
            ],
          ),
          SizedBox(
            width: 12,
          ),
          Column(
            children: <Widget>[
              _fillClipsColor(Colors.black54),
               SizedBox(height: 20),
              _fillClipsColor(Colors.black26),
            ],
          ),
          SizedBox(width: 12,),
          Column(
            children: <Widget>[
              _fillClipsColor(Colors.purple),
              SizedBox(height: 20),
              _fillClipsColor(Colors.deepOrangeAccent),
            ],
          ),
          SizedBox(width: 12,),
          Column(
            children: <Widget>[
              _fillClipsColor(Colors.black54),
              SizedBox(height: 20),
              _fillClipsColor(Colors.black38),
            ],
          ),
        ],
      ),
    );
  }

  // Fill color of each box inside the clips widget.
  Widget _fillClipsColor(Color color) {
    return InkWell(
      onTap: () {
        setState(() {
          currentColor.clear();
          currentColor.addAll([color,color]);
          _closeClipsColors();
        });
      },
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.all(Radius.circular(20))),
      ),
    );
  }

  _closeClipsColors() {
    setState(() {
      _currentBottomSheetPosition = isCollpased
          ? widget._exapendBottomSheetBottom
          : widget._collapsedBottomSheetBottom;
      isCollpased = !isCollpased;
    });
  }

  @override
  void afterFirstLayout(BuildContext context) {
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        isCollpased = true;
        _currentBottomSheetPosition = widget._collapsedBottomSheetBottom;
      });
    });
  }
}
