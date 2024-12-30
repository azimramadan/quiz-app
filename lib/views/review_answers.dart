import 'package:flutter/material.dart';
import 'package:test3/models/question_model.dart';
import 'package:test3/views/build_page_view.dart';
import 'package:test3/widgets/question_counter_widget.dart';
import 'package:test3/widgets/question_text_container.dart';

import 'package:test3/widgets/action_button.dart';
import 'package:test3/widgets/back_action_button.dart';
import 'package:test3/widgets/background_widget.dart';

class ReviewView extends StatefulWidget {
  const ReviewView({
    super.key,
  });

  @override
  State<ReviewView> createState() => _ReviewViewState();
}

class _ReviewViewState extends State<ReviewView> {
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller,
      itemCount: 8,
      itemBuilder: (context, index) {
        return QuestionReviewView(
          question: questions[index],
          questionNumber: index,
          onPressed: () {
            if (index == 7) {
              Navigator.popUntil(
                context,
                (route) => route.isFirst,
              );
            } else {
              nextPage();
            }
          },
          backAction: () {
            if (index == 0) {
              Navigator.pop(context);
            } else {
              previousPage();
            }
          },
        );
      },
    );
  }

  void previousPage() {
    controller.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  void nextPage() {
    controller.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }
}

class QuestionReviewView extends StatelessWidget {
  const QuestionReviewView({
    super.key,
    required this.question,
    required this.questionNumber,
    required this.onPressed,
    required this.backAction,
  });

  final Question question;
  final int questionNumber;
  final VoidCallback onPressed;

  final VoidCallback backAction;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        child: Column(
          spacing: 35,
          children: [
            QuestionRevirwBody(
              question: question,
              questionNumber: questionNumber,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BackActionButton(
                  onPressed: backAction,
                ),
                NextActionButton(
                  text: questionNumber == 7 ? 'Go to Home' : 'Next',
                  onPressed: onPressed,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class QuestionRevirwBody extends StatelessWidget {
  const QuestionRevirwBody({
    super.key,
    required this.question,
    required this.questionNumber,
  });
  final Question question;
  final int questionNumber;
  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 15,
        children: [
          QuestionCounter(
            questionNumber: questionNumber + 1,
          ),
          QuestionTextContainer(
            questionText: question.question,
          ),
          ChoiceReviewButton(
            icon: question.correctAnswerIndex == 0
                ? Icons.check_circle
                : question.userAnswwer == 0
                    ? Icons.dnd_forwardslash
                    : Icons.circle_outlined,
            choiceText: question.chooses[0],
          ),
          ChoiceReviewButton(
            icon: question.correctAnswerIndex == 1
                ? Icons.check_circle
                : question.userAnswwer == 1
                    ? Icons.dnd_forwardslash
                    : Icons.circle_outlined,
            choiceText: question.chooses[1],
          ),
          ChoiceReviewButton(
            icon: question.correctAnswerIndex == 2
                ? Icons.check_circle
                : question.userAnswwer == 2
                    ? Icons.dnd_forwardslash
                    : Icons.circle_outlined,
            choiceText: question.chooses[2],
          ),
          ChoiceReviewButton(
            icon: question.correctAnswerIndex == 3
                ? Icons.check_circle
                : question.userAnswwer == 3
                    ? Icons.dnd_forwardslash
                    : Icons.circle_outlined,
            choiceText: question.chooses[3],
          ),
        ],
      ),
    );
  }
}

class ChoiceReviewButton extends StatelessWidget {
  const ChoiceReviewButton({
    super.key,
    required this.icon,
    required this.choiceText,
  });
  final IconData icon;
  final String choiceText;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: icon == Icons.check_circle
              ? const Color(0xFFB8B2FF)
              : icon == Icons.dnd_forwardslash
                  ? Colors.red[400]
                  : Colors.white,
          minimumSize: const Size(double.infinity, 55),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: () {},
        child: Row(
          spacing: 10,
          children: [
            Icon(
              icon,
              size: 25,
              color: const Color(0xff2B0063),
            ),
            Text(
              choiceText,
              style: const TextStyle(
                color: Color(0xFF2B0062),
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ));
  }
}
