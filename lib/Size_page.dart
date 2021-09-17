import 'package:flutter/material.dart';

class SizeCustomTransition extends StatelessWidget {
  const SizeCustomTransition({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Center(
        child: Container(
          color: Colors.yellow,
        ),
      ),
    );
  }
}
