import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepPurpleAccent,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: Text('I Am Poor'),
        ),
        body: Center(
          child: Image(
            image: AssetImage('images/coal.png'),
          ),
        ),
      ),
    ),
  );
}
