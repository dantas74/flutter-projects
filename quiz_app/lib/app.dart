import 'package:flutter/material.dart';
import 'package:quiz_app/data.dart';
import 'package:quiz_app/layouts/default.dart';
import 'package:quiz_app/pages/home.dart';
import 'package:quiz_app/pages/questions.dart';
import 'package:quiz_app/pages/results.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() {
    return _QuizAppState();
  }
}

class _QuizAppState extends State<QuizApp> {
  List<String> selectedAnswers = [];
  late Widget activeScreen;

  @override
  void initState() {
    activeScreen = HomePage(startQuiz);
    super.initState();
  }

  void startQuiz() {
    setState(() {
      activeScreen = QuestionsPage(chooseAnswer);
    });
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = HomePage(startQuiz);
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = ResultsPage(selectedAnswers, restartQuiz);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: DefaultLayout(
          child: activeScreen,
        ),
      ),
    );
  }
}
