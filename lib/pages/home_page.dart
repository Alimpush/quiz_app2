import 'package:flutter/material.dart';
import 'package:quiz_app2/model/quiz_model.dart';
import 'package:quiz_app2/widgets/quiz_button.dart';
import 'package:quiz_app2/widgets/result_icon.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  List jooptor = <bool>[];
  List tuurajooptor = <bool>[];
  List katajooptor = <bool>[];

  void teksher(bool value) {
    if (quizzes[index].answer == value) {
      jooptor.add(true);
      tuurajooptor.add(true);
    } else {
      jooptor.add(false);
      katajooptor.add(false);
    }
    setState(() {
      if (quizzes[index] == quizzes.last) {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Сиз бул тестен ...'),
                content: Text(
                    'Туура жооптору ${tuurajooptor.length}. Ката жооптор ${katajooptor.length}'),
                actions: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        index = 0;
                        jooptor.clear();
                        tuurajooptor.clear();
                        katajooptor.clear();
                        Navigator.pop(context);
                      });
                    },
                    child: const Text('Жаңыдан баштоо'),
                  ),
                ],
              );
            });
      } else {
        index++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Тапшырма 7',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xff343434),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Text(
              quizzes[index].question,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
            const Spacer(),
            QuizButton(
                tuuraButtonbu: true,
                baskanda: (valu) {
                  teksher(valu);
                }),
            const SizedBox(height: 20),
            QuizButton(
                tuuraButtonbu: false,
                baskanda: (mani) {
                  teksher(mani);
                }),
            const SizedBox(height: 50),
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: jooptor.length,
                itemBuilder: (context, index) {
                  return jooptor[index]
                      ? const RezulButton(tuuraIconbu: true)
                      : const RezulButton(tuuraIconbu: false);
                },
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
