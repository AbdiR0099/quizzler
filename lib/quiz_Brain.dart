import 'questions.dart';

class Quiz_Brain {
  int _questionNumber = 0;
  List<Questions> _questionBank = [
    Questions('A slug\'s blood is green.', true),
    Questions(
        'Approximately one quarter of human bones are in the feet.', true),
    Questions('You can lead a cow down stairs but not up stairs.', false),
    Questions('Sharks are mammals.', false),
    Questions('The blue whale is the biggest animal to have ever lived.', true),
    Questions('Bats are blind.', false),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
    // else {
    //   _questionNumber = 0;
    // }
  }

  bool isFinished() {
    if (_questionNumber == _questionBank.length - 1) {
      print('Quiz Finished');
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }

  void pr() {
    print('$_questionNumber');
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getAnswer() {
    return _questionBank[_questionNumber].questionAns;
  }
}
