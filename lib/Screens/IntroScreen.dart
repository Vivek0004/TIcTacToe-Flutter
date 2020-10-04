import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/Screens/HomePage.dart';

class IntroScreen extends StatefulWidget {
  static const String id = 'home_screen';
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  static double fontHeight = 0.0;
  static double fontHeightTitle = 0.0;

  static var myNewFont = GoogleFonts.pressStart2P(
    textStyle: TextStyle(color: Colors.black, letterSpacing: 3),
  );
  static var myNewFontWhite = GoogleFonts.pressStart2P(
    textStyle:
        TextStyle(color: Colors.white, letterSpacing: 3, fontSize: fontHeight),
  );
  static var myTitleFont = GoogleFonts.pressStart2P(
    textStyle: TextStyle(
        color: Colors.white, letterSpacing: 3, fontSize: fontHeightTitle),
  );
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        kToolbarHeight;
    final _width = MediaQuery.of(context).size.width;

    fontHeight = _height * 0.028;
    fontHeightTitle = _height * 0.035;

    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: _height * 0.05, horizontal: _width * 0.05),
          child: Center(
            child: Column(
              children: <Widget>[
                Text(
                  'TIC TAC TOE',
                  style: myTitleFont,
                ),
                SizedBox(
                  height: _height * 0.10,
                ),
                AvatarGlow(
                  glowColor: Colors.white,
                  endRadius: _height * 0.23,
                  duration: Duration(milliseconds: 2000),
                  repeat: true,
                  showTwoGlows: true,
                  repeatPauseDuration: Duration(milliseconds: 750),
                  startDelay: Duration(milliseconds: 1000),
                  child: Material(
                    color: Colors.grey[900],
                    shape: CircleBorder(),
                    child: Image(
                      color: Colors.white,
                      image: AssetImage('assets/images/tictactoelogo.png'),
                      height: _height * 0.25,
                    ),
                  ),
                ),
                SizedBox(
                  height: _height * 0.10,
                ),
                Text(
                  '@CREATEDBYARUSH',
                  style: myNewFontWhite,
                ),
                SizedBox(
                  height: _height * 0.12,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, HomePage.id);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                      color: Colors.white,
                    ),
                    height: _height * 0.13,
                    width: _width * 0.8,
                    child: Center(
                      child: Text(
                        'PLAY GAME',
                        style: myNewFont,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
