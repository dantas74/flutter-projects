import 'package:flutter/material.dart';
import 'package:quiz_app/components/molecules/question_summary_item.dart';

class QuestionSummary extends StatelessWidget {
  final List<Map<String, Object>> data;

  const QuestionSummary(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: data
              .map(
                (e) => QuestionSummaryItem(
                  isCorrectAnswer: e['user_answer'] == e['correct_answer'],
                  questionNumber: (e['question_index'] as int) + 1,
                  question: e['question'] as String,
                  userAnswer: e['user_answer'] as String,
                  correctAnswer: e['correct_answer'] as String,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
