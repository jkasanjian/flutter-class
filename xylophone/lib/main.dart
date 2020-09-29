import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playSound(int noteNum) {
    final player = AudioCache();
    player.play('note$noteNum.wav');
  }

  Expanded buildKey({int noteNum, Color col}) {
    return Expanded(
      child: FlatButton(
        color: col,
        onPressed: () {
          playSound(noteNum);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildKey(noteNum: 1, col: Colors.red),
              buildKey(noteNum: 2, col: Colors.orange),
              buildKey(noteNum: 3, col: Colors.yellow),
              buildKey(noteNum: 4, col: Colors.green),
              buildKey(noteNum: 5, col: Colors.blue),
              buildKey(noteNum: 6, col: Colors.indigo),
              buildKey(noteNum: 7, col: Colors.purple),
            ],
          ),
        ),
      ),
    );
  }
}
