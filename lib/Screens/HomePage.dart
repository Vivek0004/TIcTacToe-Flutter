import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  static const String id = 'home_page';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool ohTurn = true; // the first player is o!
  bool winnerDisplayed = false;
  List<String> displayExOh = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];
  int exScore = 0;
  int ohScore = 0;
  int filledBoxes = 0;
  static double fontHeight = 0.0;

  static var myNewFont = GoogleFonts.pressStart2P(
    textStyle: TextStyle(color: Colors.black, letterSpacing: 3),
  );
  static var myNewFontWhite = GoogleFonts.pressStart2P(
    textStyle:
        TextStyle(color: Colors.white, letterSpacing: 3, fontSize: fontHeight),
  );

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        kToolbarHeight;
    final _width = MediaQuery.of(context).size.width;

    fontHeight = _height * 0.028;

    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: _height * 0.03, horizontal: _width * 0.01),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Player O',
                            style: myNewFontWhite,
                          ),
                          SizedBox(
                            height: _height * 0.03,
                          ),
                          Text(
                            ohScore.toString(),
                            style: myNewFontWhite,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: _height * 0.03, horizontal: _width * 0.01),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Player X',
                            style: myNewFontWhite,
                          ),
                          SizedBox(
                            height: _height * 0.03,
                          ),
                          Text(
                            exScore.toString(),
                            style: myNewFontWhite,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: (_height * 0.005).toInt(),
              child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        _tapped(index);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[700]),
                        ),
                        child: Center(
                          child: Text(
                            displayExOh[index],
                            style: TextStyle(color: Colors.white, fontSize: 40),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Expanded(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Text(
                      'TIC TAC TOE',
                      style: myNewFontWhite,
                    ),
                    SizedBox(height: _height * 0.08),
                    Text(
                      '@CREATEDBYARUSH',
                      style: myNewFontWhite,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (displayExOh[index] == '') {
        if (ohTurn) {
          displayExOh[index] = 'O';
        } else {
          displayExOh[index] = 'X';
        }

        filledBoxes++;
        ohTurn = !ohTurn;
        _checkWinner();
      }
    });
  }

  void _checkWinner() {
    // checks 1st row
    if (displayExOh[0] == displayExOh[1] &&
        displayExOh[0] == displayExOh[2] &&
        displayExOh[0] != '') {
      _showWinDialogue(displayExOh[0]);
      winnerDisplayed = true;
    }

    // checks 2nd row
    if (displayExOh[3] == displayExOh[4] &&
        displayExOh[3] == displayExOh[5] &&
        displayExOh[3] != '') {
      _showWinDialogue(displayExOh[3]);
      winnerDisplayed = true;
    }

    // checks 3rd row
    if (displayExOh[6] == displayExOh[7] &&
        displayExOh[6] == displayExOh[8] &&
        displayExOh[6] != '') {
      _showWinDialogue(displayExOh[6]);
      winnerDisplayed = true;
    }

    // checks 1st column
    if (displayExOh[0] == displayExOh[3] &&
        displayExOh[0] == displayExOh[6] &&
        displayExOh[0] != '') {
      _showWinDialogue(displayExOh[0]);
      winnerDisplayed = true;
    }

    // checks 2nd column
    if (displayExOh[1] == displayExOh[4] &&
        displayExOh[1] == displayExOh[7] &&
        displayExOh[1] != '') {
      _showWinDialogue(displayExOh[1]);
      winnerDisplayed = true;
    }

    // checks 3rd column
    if (displayExOh[2] == displayExOh[5] &&
        displayExOh[2] == displayExOh[8] &&
        displayExOh[2] != '') {
      _showWinDialogue(displayExOh[2]);
      winnerDisplayed = true;
    }

    // checks 1st diagonal
    if (displayExOh[0] == displayExOh[4] &&
        displayExOh[0] == displayExOh[8] &&
        displayExOh[0] != '') {
      _showWinDialogue(displayExOh[0]);
      winnerDisplayed = true;
    }

    // checks 2nd diagonal
    if (displayExOh[2] == displayExOh[4] &&
        displayExOh[2] == displayExOh[6] &&
        displayExOh[2] != '') {
      _showWinDialogue(displayExOh[2]);
      winnerDisplayed = true;
    }

    if (filledBoxes == 9 && !winnerDisplayed) {
      _showDrawDialogue();
    }
  }

  void _showWinDialogue(String winner) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'WINNER IS: $winner',
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Play Again'),
                onPressed: () {
                  _clearBoard();
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });

    if (winner == 'O') {
      setState(() {
        ohScore++;
      });
    } else {
      setState(() {
        exScore++;
      });
    }
  }

  void _showDrawDialogue() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('DRAW!'),
            actions: <Widget>[
              FlatButton(
                child: Text('Play Again!'),
                onPressed: () {
                  _clearBoard();
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  void _clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayExOh[i] = '';
      }
    });

    filledBoxes = 0;
    winnerDisplayed = false;
  }
}
