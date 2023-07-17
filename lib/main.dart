import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';


void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playNote(number) {
    final player = AudioPlayer();
    player.play(AssetSource('note$number.wav'));
  }

  Expanded buildKey(Color color, int number) {
    return Expanded(
      child: Container(
        color: color,
        child: TextButton(
          onPressed: () {
            playNote(number);
          },
          child: Text(''),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
      SystemChrome.setPreferredOrientations([
      //prevent orientation
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                buildKey(Colors.red, 1),
                buildKey(Colors.orange, 2),
                buildKey(Colors.yellowAccent, 3),
                buildKey(Colors.green, 4),
                buildKey(Colors.teal, 5),
                buildKey(Colors.blue, 6),
                buildKey(Colors.purple, 7),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
