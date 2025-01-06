import 'package:app05_quizapp_20242/question.dart';
import 'package:app05_quizapp_20242/quiz_brain.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> scoreKeeper = [];

  QuizBrain quizBrain = QuizBrain();

  checkAnswer(bool userAnswer) {
    if (quizBrain.isFinished() == true) {
      //mensaje finalizado
    } else {
      bool correctAnswer = quizBrain.getQuestionAnswer();

      if (correctAnswer == userAnswer) {
        scoreKeeper.add(
          const Icon(Icons.check, color: Colors.greenAccent),
        );
      } else {
        scoreKeeper.add(
          const Icon(Icons.close, color: Colors.redAccent),
        );
      }

      quizBrain.nextQuestion();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0d1b2a),
      appBar: AppBar(
        title: const Text(
          'QuizApp',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF0d1b2a),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: Center(
              child: Text(
                //quizBrain.questions[questionNumber].questionText,
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                onPressed: () {
                  checkAnswer(true);
                },
                color: Colors.greenAccent,
                child: const Text("Verdadero"),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                onPressed: () {
                  checkAnswer(false);
                },
                color: Colors.redAccent,
                child: const Text("Falso"),
              ),
            ),
          ),
          Row(
            children: scoreKeeper,
          ),
        ],
      ),
    );
  }
}
