import 'package:flutter/material.dart';
import 'package:test3/models/question_model.dart';
import 'package:test3/widgets/action_button.dart';
import 'package:test3/widgets/back_action_button.dart';
import 'package:test3/widgets/background_widget.dart';
import 'package:test3/widgets/question_view_body.dart';

class QuestionView extends StatelessWidget {
  const QuestionView(
      {super.key,
      required this.question,
      required this.onPressedBack,
      required this.onPressedNext,
      required this.textAction,
      required this.questionNumber});
  final Question question;
  final String textAction;
  final void Function() onPressedBack;
  final void Function() onPressedNext;
  final int questionNumber;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        child: Column(
          spacing: 35,
          children: [
            QuestionViewBody(
              question: question,
              questionNumber: questionNumber,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BackActionButton(
                  onPressed: onPressedBack,
                ),
                NextActionButton(
                  text: textAction,
                  onPressed: onPressedNext,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
