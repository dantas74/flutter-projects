import 'package:flutter/material.dart';
import 'package:quiz_app/components/atoms/default_elevated_button.dart';
import 'package:quiz_app/components/atoms/default_text.dart';
import 'package:quiz_app/models/question.dart';

class Question extends StatelessWidget {
  final QuestionModel question;
  final void Function(String) answerQuestion;

  const Question(this.question, this.answerQuestion, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DefaultText(
              question.text,
              fontSize: 24,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 201, 153, 251),
            ),
            const SizedBox(
              height: 30,
            ),
            ...question.shuffledAnswers.map((e) {
              return DefaultElevatedButton(
                onPressed: () {
                  answerQuestion(e);
                },
                child: DefaultText(
                  e,
                  fontSize: 12,
                  textAlign: TextAlign.center,
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
