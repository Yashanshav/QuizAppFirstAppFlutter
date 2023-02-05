import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State {
  final questions = const [
    {
      'questionText': 'What\'s your favourite color?',
      'answers': [
        {'text': 'blue', 'score': 10},
        {'text': 'green', 'score': 8},
        {'text': 'white', 'score': 6},
        {'text': 'black', 'score': 3}
      ]
    },
    {
      'questionText': 'What\'s your favourite animal?',
      'answers': [
        {'text': 'rabbit', 'score': 10},
        {'text': 'elephant', 'score': 8},
        {'text': 'whale', 'score': 6},
        {'text': 'lion', 'score': 3}
      ]
    },
    {
      'questionText': 'Who\'s your favourite instructor?',
      'answers': [
        {'text': 'angela', 'score': 10},
        {'text': 'max', 'score': 8},
        {'text': 'stefan', 'score': 6},
        {'text': 'julian', 'score': 3}
      ]
    }
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
      _questionIndex++;
    });

    print(_questionIndex);

    if (_questionIndex < questions.length) {
      print('We have more questions!');
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text('My First App'),
            ),
            body: _questionIndex < questions.length
                ? Quiz(questions, _answerQuestion, _questionIndex)
                : Result(_totalScore, _resetQuiz)));
  }
}
