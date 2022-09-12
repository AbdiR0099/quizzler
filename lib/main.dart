import 'package:flutter/material.dart';
import 'package:quizzler/questions.dart';

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
  List<Questions> question = [
    Questions(q: 'A slug\'s blood is green.', a: true),
    Questions(
        q: 'Approximately one quarter of human bones are in the feet.',
        a: true),
    Questions(q: 'You can lead a cow down stairs but not up stairs.', a: false),
  ];

  int questionNumber = 0;
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
                questions[questionNumber],
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
                bool correctAns = answer[questionNumber];
                if (correctAns == true) {
                  // Icon(Icons.check);
                  print('user got it right');
                } else {
                  // Icon(Icons.close);
                  print('user got it wrong');
                }
                setState(() {
                  questionNumber++;
                  if (questionNumber > 2) {
                    questionNumber = 0;
                  }
                });
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
                bool correctAns = answer[questionNumber];
                if (correctAns == false) {
                  // Icon(Icons.check);
                  print('user got it right');
                } else {
                  // Icon(Icons.close);
                  print('user got it wrong');
                }
                setState(() {
                  questionNumber++;
                  if (questionNumber > 2) {
                    questionNumber = 0;
                  }
                });
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
        // Row(
        //   children:
        // ),
      ],
    );
  }
}
