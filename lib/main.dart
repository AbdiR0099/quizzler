import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'quiz_Brain.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
  // List<String> questions = [
  //   'A slug\'s blood is green.',
  //   'Approximately one quarter of human bones are in the feet.',
  //   'You can lead a cow down stairs but not up stairs.',
  // ];
  // List<bool> answer = [true, true, false];
  Quiz_Brain quiz_brain = Quiz_Brain();
  void checkAnswer(bool userpickAnswer) {
    bool correctAns = quiz_brain.getAnswer();
    setState(() {
      if (quiz_brain.isFinished()) {
        quiz_brain.reset();
        Alert(
          context: context,
          type: AlertType.error,
          title: "QUIZ ENDED",
          desc: "Take Quiz Again",
          buttons: [
            DialogButton(
              child: Text(
                "Quiz End",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              width: 120,
            )
          ],
        ).show();
        scoreKeeper = [];
      } else {
        if (correctAns == userpickAnswer) {
          // Icon(Icons.check);
          scoreKeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
          print('user got it right');
        } else {
          scoreKeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
          print('user got it wrong');
        }
        quiz_brain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Text(
                quiz_brain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: MaterialButton(
              color: Colors.green,
              onPressed: () {
                checkAnswer(true);
              },
              child: Text(
                'TRUE',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: MaterialButton(
              color: Colors.red,
              onPressed: () {
                checkAnswer(false);
              },
              child: Text(
                'FALSE',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(),
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}
