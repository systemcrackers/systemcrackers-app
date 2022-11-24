import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'dart:math';

class TextToSpeech extends StatefulWidget {
  const TextToSpeech({super.key});

  @override
  State<TextToSpeech> createState() => _TextToSpeechState();
}

enum TtsState { playing, stopped }

class _TextToSpeechState extends State<TextToSpeech> {
  late FlutterTts _flutterTts;
  String? _tts;
  String? _prevTts;
  TtsState _ttsState = TtsState.stopped;

  @override
  void initState() {
    super.initState();
    initTts();
  }

  @override
  void dispose() {
    super.dispose();
    _flutterTts.stop();
  }

  initTts() async {
    _flutterTts = FlutterTts();
    await _flutterTts.awaitSpeakCompletion(true);

    _flutterTts.setStartHandler(() {
      setState(() {
        _ttsState = TtsState.playing;
      });
    });
    _flutterTts.setCompletionHandler(() {
      setState(() {
        _ttsState = TtsState.stopped;
      });
    });
    _flutterTts.setCancelHandler(() {
      setState(() {
        _ttsState = TtsState.stopped;
      });
    });
    _flutterTts.setErrorHandler((msg) {
      print("$msg");
      setState(() {
        _ttsState = TtsState.stopped;
      });
    });
  }

  List<String> Alphabets = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z'
  ];
  // List<String> Numbers = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0'];

  @override
  Widget build(BuildContext context) {
    Random random = new Random();
    int index = random.nextInt(Alphabets.length);
    _tts = Alphabets[index];
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Guided Learning',
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Text(
              'This is a guided learning module. You can listen to the text and follow along with the text on the screen.',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 40, left: 20, right: 20),
            child: Text(
              'The text is read aloud by a text-to-speech engine',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Poppins',
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Center(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 60, horizontal: 50),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    // _prevTts = _tts;
                    // _tts = _prevTts;
                    speak();
                  },
                  child: Text(
                    Alphabets[index],
                    style: TextStyle(
                      fontSize: 125,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Timer(Duration(seconds: 5), () {});
              setState(() {
                print("Hello");
                index = random.nextInt(Alphabets.length);
                _tts = Alphabets[index];
                // speak();
              });
            },
            child: const Text(
              'Next Alphabet',
            ),
          )
        ],
      ),
    );
  }

  Future speak() async {
    await _flutterTts.setLanguage("en-US");
    await _flutterTts.setPitch(1);
    await _flutterTts.setVolume(1);
    await _flutterTts.setSpeechRate(0.3);
    await _flutterTts.speak(_tts!);
    // if (_tts != null) {
    //   if (_tts!.isNotEmpty) {
    //     var result = await _flutterTts.speak(_tts!);
    //     if (result == 1) setState(() => _ttsState = TtsState.playing);
    //   }
    // }
  }

  Future stop() async {
    var result = await _flutterTts.stop();
    if (result == 1) setState(() => _ttsState = TtsState.stopped);
  }
}
