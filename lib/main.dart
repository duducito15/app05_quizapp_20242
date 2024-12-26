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

  List<Widget> scoreKeeper = [
    Icon(Icons.check, color: Colors.greenAccent),
    Icon(Icons.close, color: Colors.redAccent),
    Icon(Icons.check, color: Colors.greenAccent),
    Icon(Icons.close, color: Colors.redAccent),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0d1b2a),
      appBar: AppBar(
        title: const Text(
          'QuizApp',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF0d1b2a),
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
                style: TextStyle(fontSize: 20, color: Colors.white),
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
                  print(questionNumber);
                  setState(() {});
                },
                child: const Text("Verdadero"),
                color: Colors.greenAccent,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                onPressed: () {},
                child: const Text("Falso"),
                color: Colors.redAccent,
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
