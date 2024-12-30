import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
  int questionNumber = 0;

  List<String> questions = [
    "El hombre llegó a la Luna?",
    "Tomaste desayuno?",
    "El tomaylla es arquero?",
    "Faltas a clases?",
  ];

  List<bool> answers = [
    true,
    true,
    false,
    true,
  ];

  List<Widget> scoreKeeper = [];

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
                questions[questionNumber],
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
                  bool correctAnswer = answers[questionNumber];

                  if (correctAnswer == true) {
                    scoreKeeper.add(
                      Icon(Icons.check, color: Colors.greenAccent),
                    );
                  } else {
                    scoreKeeper.add(
                      Icon(Icons.close, color: Colors.redAccent),
                    );
                  }

                  questionNumber++;
                  setState(() {});
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
                  questionNumber++;
                  setState(() {});
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
