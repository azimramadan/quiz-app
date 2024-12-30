import 'package:flutter/material.dart';
import 'package:test3/widgets/background_widget.dart';
import 'package:test3/widgets/start_quiz_view_body.dart';

class StartQuizView extends StatelessWidget {
  const StartQuizView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BackgroundWidget(
        child: StartQuizViewBody(),
      ),
    );
  }
}
