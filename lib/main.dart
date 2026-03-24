import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: XylophonePage(),
  ));
}

class XylophonePage extends StatefulWidget {
  const XylophonePage({super.key});

  @override
  State<XylophonePage> createState() => _XylophonePageState();
}

class _XylophonePageState extends State<XylophonePage> {
  final player = AudioPlayer();

  void playSound(String fileName) async {
    await player.play(AssetSource('sounds/$fileName'));
  }

  Widget buildPad(Color color, String fileName) {
    return GestureDetector(
      onTap: () => playSound(fileName),
      child: Container(
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Container(
          width: 260,
          height: 520,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.black, width: 2),
          ),
          child: Column(
            children: [
              const SizedBox(height: 8),
              const Text(
                "SOUND BORED",
                style: TextStyle(
                  fontSize: 18,
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 3,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                  children: [
                    buildPad(Colors.lightGreen, "sound1.wav"),
                    buildPad(Colors.green, "sound2.wav"),
                    buildPad(Colors.greenAccent, "sound3.wav"),
                    buildPad(Colors.yellow[200]!, "sound4.wav"),
                    buildPad(Colors.orange[300]!, "sound5.wav"),
                    buildPad(Colors.orange, "sound6.wav"),
                    buildPad(Colors.red, "sound7.wav"),
                    buildPad(Colors.redAccent, "sound8.wav"),
                    buildPad(Colors.pink[100]!, "sound9.wav"),
                    buildPad(Colors.lightBlue[200]!, "sound10.wav"),
                    buildPad(Colors.blue[300]!, "sound11.wav"),
                    buildPad(Colors.blue, "sound12.wav"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}