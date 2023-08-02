import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz_demo/data/question.dart';
import 'package:quiz_demo/quiz/question_screen.dart';
import 'package:quiz_demo/quiz/result_screen.dart';
import 'package:quiz_demo/quiz/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = "start-screen";

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    super.initState();
  }

  void _switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void _restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'question-screen';
    });
  }

  void _chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == question.length) {
      setState(() {
        activeScreen = "result-screen";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(_switchScreen);

    if (activeScreen == 'question-screen') {
      screenWidget = QuestionScreen(onSelectedAnswer: _chooseAnswer);
    }

    if (activeScreen == 'result-screen') {
      screenWidget = ResultScreen(
        chosenAnswer: selectedAnswers,
        onRestart: _restartQuiz,
      );
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
