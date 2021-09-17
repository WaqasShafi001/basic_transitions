import 'package:basic_transitions_zia/Fade_page.dart';
import 'package:basic_transitions_zia/Rotate_page.dart';
import 'package:basic_transitions_zia/Scale_page.dart';
import 'package:basic_transitions_zia/Size_page.dart';
import 'package:basic_transitions_zia/Slide_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.blue,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                onPressed: () {
                  Navigator.push(context, slideRoute());
                },
                child: Text("Slide Transition"),
                color: Colors.red,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.push(context, scaleRoute());
                },
                child: Text("Scale Transition"),
                color: Colors.green,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.push(context, rotateRoute());
                },
                child: Text("Rotate Transition"),
                color: Colors.orange,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.push(context, sizeRoute());
                },
                child: Text("Size Transition"),
                color: Colors.yellow,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.push(context, fadeRoute());
                },
                child: Text("Fade Transition"),
                color: Colors.grey,
              ),
            ],
          )),
    );
  }

  Route slideRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          SlideCustomTransition(),
      transitionDuration: Duration(milliseconds: 1000),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0, 1);
        var end = Offset.zero;
        var curve = Curves.easeInQuint;
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  ////////////////////////////////////////
  Route scaleRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          ScaleCustomTransition(),
      transitionDuration: Duration(milliseconds: 1000),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // var begin = Offset(0, 1);
        // var end = Offset.zero;
        // var curve = Curves.easeInOut;
        // var tween =
        //     Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return ScaleTransition(
          scale: animation,
          child: child,
        );
      },
    );
  }

  ///////////////////////////////////////////
  Route rotateRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          RotateCustomTransition(),
      transitionDuration: Duration(milliseconds: 1000),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // var begin = Offset(0, 1);
        // var end = Offset.zero;
        // var curve = Curves.easeInQuint;
        // var tween =
        //     Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return RotationTransition(
          turns: animation,
          child: child,
        );
      },
    );
  }

  ////////////////////////////////////////////////////

  Route sizeRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          SizeCustomTransition(),
      transitionDuration: Duration(milliseconds: 2000),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // var begin = Offset(0, 1);
        // var end = Offset.zero;
        // var curve = Curves.easeInQuint;
        // var tween =
        //     Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return Align(
          child: SizeTransition(
            sizeFactor: animation,
            child: child,
            axis: Axis.vertical,
          ),
        );
      },
    );
  }
  ///////////////////////////////////////////////////////////////

  Route fadeRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          FadeCustomTransition(),
      transitionDuration: Duration(milliseconds: 1000),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // var begin = Offset(0, 1);
        // var end = Offset.zero;
        // var curve = Curves.easeInQuint;
        // var tween =
        //     Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }
}
