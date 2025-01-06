import 'package:app05_quizapp_20242/question.dart';

class QuizBrain {
  final List<Question> _questions = [
    Question(questionText: "El hombre llegó a la Luna?", questionAnswer: true),
    Question(questionText: "Tomaste desayuno?", questionAnswer: true),
    Question(questionText: "El tomaylla es arquero?", questionAnswer: false),
    Question(questionText: "Faltas a clases?", questionAnswer: true),
  ];

  int _questionNumber = 0;

  getQuestionText() {
    return _questions[_questionNumber].questionText;
  }

  getQuestionAnswer() {
    return _questions[_questionNumber].questionAnswer;
  }

  nextQuestion() {
    if (_questionNumber < _questions.length - 1) {
      _questionNumber++;
    }
  }

  bool isFinished() {
    if (_questionNumber >= _questions.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void restart() {
    _questionNumber = 0;
  }
}
