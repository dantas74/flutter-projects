import 'package:flutter/material.dart';
import 'package:quiz_app/components/atoms/default_text.dart';
import 'package:quiz_app/components/organisms/question_summary.dart';
import 'package:quiz_app/data.dart';

class ResultsPage extends StatelessWidget {
  final List<String> chosenAnswers;
  final void Function() restartQuiz;

  const ResultsPage(this.chosenAnswers, this.restartQuiz, {super.key});

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for (int i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i]
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final numTotalQuestions = questions.length;
    final numCorrectAnswers = summaryData
        .where((e) => e['user_answer'] == e['correct_answer'])
        .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DefaultText(
              'You answered $numCorrectAnswers out of $numTotalQuestions questions correctly!',
              fontSize: 20,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: restartQuiz,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.refresh),
              label: const DefaultText('Restart Quiz!'),
            )
          ],
        ),
      ),
    );
  }
}
