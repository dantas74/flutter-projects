import 'package:flutter/material.dart';
import 'package:quiz_app/components/atoms/default_text.dart';
import 'package:quiz_app/components/atoms/default_outlined_button.dart';

class HomePage extends StatelessWidget {
  final void Function() startQuiz;

  const HomePage(this.startQuiz, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/img/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
          const SizedBox(
            height: 80,
          ),
          const DefaultText('Learn Flutter the fun way!'),
          const SizedBox(
            height: 30,
          ),
          DefaultOutlinedButton(
            onPressed: startQuiz,
            icon: Icons.arrow_right_alt,
            child: const DefaultText('Start Quiz'),
          )
        ],
      ),
    );
  }
}
