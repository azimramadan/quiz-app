import 'package:flutter/material.dart';
import 'package:test3/models/question_model.dart';
import 'package:test3/widgets/choice_button.dart';
import 'package:test3/widgets/question_counter_widget.dart';
import 'package:test3/widgets/question_text_container.dart';

class QuestionViewBody extends StatefulWidget {
  const QuestionViewBody({
    super.key,
    required this.question,
    required this.questionNumber,
  });
  final Question question;
  final int questionNumber;
  @override
  State<QuestionViewBody> createState() => _QuestionViewBodyState();
}

class _QuestionViewBodyState extends State<QuestionViewBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 15,
      children: [
        QuestionCounter(
          questionNumber: widget.questionNumber,
        ),
        QuestionTextContainer(
          questionText: widget.question.question,
        ),
        ChoiceButton(
          onPressed: () {
            setState(() {
              widget.question.userAnswwer = 0;
            });
          },
          icon: widget.question.userAnswwer == 0
              ? Icons.circle
              : Icons.circle_outlined,
          choiceText: widget.question.chooses[0],
        ),
        ChoiceButton(
          onPressed: () {
            setState(() {
              widget.question.userAnswwer = 1;
            });
          },
          icon: widget.question.userAnswwer == 1
              ? Icons.circle
              : Icons.circle_outlined,
          choiceText: widget.question.chooses[1],
        ),
        ChoiceButton(
          onPressed: () {
            setState(() {
              widget.question.userAnswwer = 2;
            });
          },
          icon: widget.question.userAnswwer == 2
              ? Icons.circle
              : Icons.circle_outlined,
          choiceText: widget.question.chooses[2],
        ),
        ChoiceButton(
          onPressed: () {
            setState(() {
              widget.question.userAnswwer = 3;
            });
          },
          icon: widget.question.userAnswwer == 3
              ? Icons.circle
              : Icons.circle_outlined,
          choiceText: widget.question.chooses[3],
        ),
      ],
    );
  }
}
