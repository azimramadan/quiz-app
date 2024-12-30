import 'package:flutter/material.dart';
import 'package:test3/views/build_page_view.dart';
import 'package:test3/views/review_answers.dart';
import 'package:test3/widgets/background_widget.dart';
import 'package:test3/widgets/custom_text_widget.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CustomTextWidget(
            mainAxisAlignment: MainAxisAlignment.start,
            text: 'Congratulations!',
            fontSize: 16,
          ),
          const SizedBox(height: 8),
          const CustomTextWidget(
            mainAxisAlignment: MainAxisAlignment.start,
            text: 'Here is your score',
            fontSize: 24,
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${calculateScore().toString()}/8',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 55,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ReviewView(),
                  ));
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 55),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'Review answers',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      )),
    );
  }

  int calculateScore() {
    int score = 0;
    for (var element in questions) {
      if (element.userAnswwer == element.correctAnswerIndex) {
        score += 1;
      }
    }
    return score;
  }
}
