import 'package:flutter/material.dart';
import 'package:test3/models/question_model.dart';
import 'package:test3/views/first_question_view.dart';
import 'package:test3/views/question_view.dart';
import 'package:test3/views/result_page.dart';
import 'package:test3/widgets/custom_alert_dialog.dart';

int currentPage = 0;

class MyPageView extends StatefulWidget {
  const MyPageView({super.key});

  @override
  State<MyPageView> createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView> {
  late PageController controller;

  @override
  void initState() {
    super.initState();
    // البدء من الصفحة المخزنة
    controller = PageController(initialPage: currentPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        onPageChanged: (index) {
          setState(() {
            currentPage = index; // تحديث الصفحة الحالية
          });
        },
        itemCount: 8,
        itemBuilder: (context, index) {
          if (index == 0) {
            return FirstQuestionView(
              question: questions[0],
              onPressed: nextPage,
            );
          } else if (index == 7) {
            return QuestionView(
              question: questions[7],
              onPressedBack: previousPage,
              onPressedNext: () {
                if (LogicshowDialog()) {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return const CustomAlertDialog();
                    },
                  );
                } else {
                  currentPage = -1;
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return ResultPage();
                    },
                  ));
                }
              },
              textAction: 'Submit',
              questionNumber: 8,
            );
          } else {
            return QuestionView(
              question: questions[index],
              onPressedBack: previousPage,
              onPressedNext: nextPage,
              textAction: 'Next',
              questionNumber: index + 1,
            );
          }
        },
      ),
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

  bool LogicshowDialog() {
    for (var element in questions) {
      if (element.userAnswwer == null) {
        return true;
      } else {
        continue;
      }
    }
    return false;
  }
}

List<Question> questions = [
  Question(
    question:
        'What river flows through Egypt and is considered the longest in the world?',
    chooses: [
      'Nile River',
      'Amazon River',
      'Yangtze River',
      'Mississippi River',
    ],
    correctAnswerIndex: 0,
  ),
  Question(
    question:
        'In which year did Egypt win the Africa Cup of Nations for the first time?',
    chooses: [
      '1955',
      '1957',
      '1962',
      '1963',
    ],
    correctAnswerIndex: 1,
  ),
  Question(
    question: 'In which year did Egypt gain independence from the British?\n',
    chooses: [
      '1945',
      '1952',
      '1936',
      '1960',
    ],
    correctAnswerIndex: 2,
  ),
  Question(
    question: 'What is the official language of Egypt?',
    chooses: [
      'Arabic',
      'English',
      'French',
      'Spanish',
    ],
    correctAnswerIndex: 0,
  ),
  Question(
    question: 'What is the currency of Egypt?',
    chooses: [
      'Pound',
      'Dollar',
      'Euro',
      'Riyal',
    ],
    correctAnswerIndex: 0,
  ),
  Question(
    question: 'Which ancient wonder is located in Egypt?',
    chooses: [
      'Colossus of Rhodes',
      'Hanging Gardens',
      'Temple of Artemis',
      'Great Pyramid of Giza',
    ],
    correctAnswerIndex: 3,
  ),
  Question(
    question: 'What is the largest desert in Egypt?',
    chooses: [
      'Nubian Desert',
      'Libyan Desert',
      'Sahara Desert',
      'Sinai Desert',
    ],
    correctAnswerIndex: 2,
  ),
  Question(
    question: 'Who was the first president of Egypt?',
    chooses: [
      'Anwar Sadat',
      'Gamal Abdel Nasser',
      'Mohamed Morsi',
      'Muhammad Ali',
    ],
    correctAnswerIndex: 1,
  ),
];
