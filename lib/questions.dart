class Questions {
  late String questionText;
  late bool questionAns;

  // Questions({String q = 'a', bool a = true}) {
  //   questionText = q;
  //   questionAns = a;
  // }
  Questions(String q, bool a) {
    questionText = q;
    questionAns = a;
  }
}
// Questions newQuestion = Questions('No q:,a: required due to no {}', true);
