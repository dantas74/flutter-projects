import 'package:flutter/material.dart';
import 'package:quiz_app/components/organisms/question.dart';
import 'package:quiz_app/data.dart';

class QuestionsPage extends StatefulWidget {
  final void Function(String) selectAnswer;
  const QuestionsPage(this.selectAnswer, {super.key});

  @override
  State<QuestionsPage> createState() {
    return _QuestionsPageState();
  }
}

class _QuestionsPageState extends State<QuestionsPage> {
  var currentQuestionIndex = 0;

  void answerQuestion(String answer) {
    widget.selectAnswer(answer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return Question(currentQuestion, answerQuestion);
  }
}
