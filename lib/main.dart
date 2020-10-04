import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  String displayExOh = '';
  double _scale;
  AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;
    return Scaffold(
      backgroundColor: Colors.white,
      body: GridView.builder(
        itemCount: 9,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: _tapped,
            child: Transform.scale(
              scale: _scale,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[700]),
                  borderRadius: BorderRadius.circular(100),
                  //boxShadow: ,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFFA7BFE8),
                      Color(0xFF6190E8),
                    ],
                  ),
                ),
                child: Center(
                  child: Text(
                    displayExOh,
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _tapped() {
    _controller.forward();
    setState(() {
      if (displayExOh == 'O') {
        displayExOh = 'X';
      } else {
        displayExOh = 'O';
      }
    });
    _controller.addStatusListener((status) {
      if (_controller.status == AnimationStatus.completed) {
        _controller.reverse();
      }
    });
  }
}
