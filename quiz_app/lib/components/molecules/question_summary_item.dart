import 'package:flutter/material.dart';
import 'package:quiz_app/components/atoms/default_text.dart';

class QuestionSummaryItem extends StatelessWidget {
  final bool isCorrectAnswer;
  final int questionNumber;
  final String question;
  final String userAnswer;
  final String correctAnswer;

  const QuestionSummaryItem({
    super.key,
    required this.isCorrectAnswer,
    required this.questionNumber,
    required this.question,
    required this.userAnswer,
    required this.correctAnswer,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 30,
          height: 30,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: isCorrectAnswer
                  ? Color.fromARGB(255, 150, 198, 241)
                  : Color.fromARGB(255, 249, 133, 241),
              borderRadius: BorderRadius.circular(100)),
          child: DefaultText(
            questionNumber.toString(),
            fontSize: 14,
            textAlign: TextAlign.center,
            color: const Color.fromARGB(255, 78, 13, 151),
          ),
        ),
        const SizedBox(
          width: 30,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DefaultText(
                question,
                fontSize: 16,
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 5,
              ),
              DefaultText(
                userAnswer,
                fontSize: 14,
                color: Color.fromARGB(255, 202, 171, 252),
              ),
              DefaultText(
                correctAnswer,
                fontSize: 14,
                color: Color.fromARGB(255, 181, 254, 246),
              )
            ],
          ),
        )
      ],
    );
  }
}
