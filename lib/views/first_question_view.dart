import 'package:flutter/material.dart';
import 'package:test3/models/question_model.dart';
import 'package:test3/widgets/action_button.dart';
import 'package:test3/widgets/background_widget.dart';
import 'package:test3/widgets/question_view_body.dart';

class FirstQuestionView extends StatelessWidget {
  const FirstQuestionView(
      {super.key, required this.question, required this.onPressed});
  final Question question;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        child: Column(
          spacing: 35,
          children: [
            QuestionViewBody(
              question: question,
              questionNumber: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                NextActionButton(
                  text: 'Next',
                  onPressed: onPressed,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
