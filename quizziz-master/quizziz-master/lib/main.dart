import 'package:flutter/material.dart';
import 'package:quizziz/question.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  bool isCorrect = false;

  int counter = 0;

  List<Icon> scoreKeeper = [];

  List<Question> questionBank = [
    Question(question: 'Are plants always green?', answer: false),
    Question(question: 'Are boats always float?', answer: false),
    Question(
        question: 'Approximately one quarter of human bones are in the feet',
        answer: true)
  ];
  /*List<String> questions = [
    'Are plants always green?',
    'Are boats always float?',
    'Approximately one quarter of human bones are in the feet',
  ];

  List<bool> answers = [
    false,
    false,
    true,
  ];
*/
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 7,
          child: Center(
            child: Text(
              questionBank[counter].question,
              style: TextStyle(color: Colors.white70, fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        // true button
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith(
                      (states) => Colors.green),
                  foregroundColor: MaterialStateProperty.resolveWith(
                      (states) => Colors.white),
                  shape: MaterialStateProperty.resolveWith(
                      (states) => BeveledRectangleBorder())),
              child: Text('True'),
              onPressed: () {
                if (questionBank[counter].answer == true) {
                  isCorrect = true;
                }

                setState(() {
                  if (isCorrect) {
                    scoreKeeper.add(Icon(Icons.check, color: Colors.green));
                  } else {
                    scoreKeeper.add(Icon(Icons.close, color: Colors.red));
                  }

                  isCorrect = false;

                  if (counter == questionBank.length - 1) {
                    counter = 0;
                  } else {
                    counter++;
                  }
                });
              },
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.red),
                    foregroundColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.white),
                    shape: MaterialStateProperty.resolveWith(
                        (states) => BeveledRectangleBorder())),
                child: Text('False'),
                onPressed: () {
                  if (questionBank[counter].answer == false) {
                    isCorrect = false;
                  }

                  setState(() {
                    if (isCorrect) {
                      scoreKeeper.add(Icon(Icons.close, color: Colors.red));
                    } else {
                      scoreKeeper.add(Icon(Icons.check, color: Colors.green));
                    }

                    isCorrect = true;

                    if (counter == questionBank.length - 1) {
                      counter = 0;
                    } else {
                      counter++;
                    }
                  });
                }),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
        //TODO: Add a Row widget here as your scorekeeper
      ],
    );
  }
}

/*
Question1: 'Are plants always green?', false,
Question2: 'Are boats always float?', false,
Question3: 'Approximately one quarter of human bones are in the feet', true,
* */
