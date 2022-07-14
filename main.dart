import 'package:flutter/material.dart';

import './quiz.dart';

import './result.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': '1. Who is the PM of india?',
      'answers': [
        {'text': 'mamatha benarji', 'score': -1},
        {'text': 'venkayya naidu', 'score': -1},
        {'text': 'Narendra Modi', 'score': 2},
        {'text': 'Rahul Gandhi', 'score': -1},
      ],
    },
    {
      'questionText': '2. What is ourr national animal?',
      'answers': [
        {'text': 'Leopard', 'score': -1},
        {'text': 'Fox', 'score': -1},
        {'text': 'Lion', 'score': -1},
        {'text': 'Tiger', 'score': 2},
      ],
    },
    {
      'questionText': ' 3. Eiffel tower is in which country?',
      'answers': [
        {'text': 'Germany', 'score': -1},
        {'text': 'France', 'score': 2},
        {'text': 'pakistan', 'score': -1},
        {'text': 'newzeland', 'score': -1},
      ],
    },
    {
      'questionText': '4. Who is father of indian nation?',
      'answers': [
        {'text': 'Mahatma gandhi', 'score': 2},
        {'text': 'bhagat singh', 'score': -1},
        {'text': 'sardar vallabhai patel', 'score': -1},
        {'text': 'Nehru', 'score': -1},
      ],
    },
    {
      'questionText':
          '5. Is Flutter for Web and Desktop available in stable version?',
      'answers': [
        {
          'text': 'true',
          'score': -1,
        },
        {'text': 'false', 'score': 2},
      ],
    },
  ];

  var _questionIndex = 0;

  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;

      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    // ignore: avoid_print

    print(_questionIndex);

    if (_questionIndex < _questions.length) {
      // ignore: avoid_print

      print('We have more questions!');
    } else {
      // ignore: avoid_print

      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Geeks for Geeks'),
          backgroundColor: const Color(0xFF00E676),
        ),

        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                ) //Quiz

              : Result(_totalScore, _resetQuiz),
        ), //Padding
      ), //Scaffold

      debugShowCheckedModeBanner: false,
    ); //MaterialApp
  }
}
