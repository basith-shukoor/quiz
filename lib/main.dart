import 'package:flutter/material.dart';
import 'package:quiz/modelclass.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(
    MaterialApp(debugShowCheckedModeBanner: false, home: const Quiz()),
  );
}
Myquestion q=Myquestion();


class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int questionnumber = 0;
  List<Icon> symbol = [];
  List<Myquestion> questionsbank = [
    Myquestion(q: "elephant have black horn", a: false),
    Myquestion(q: "china is neighbour country of india", a: true),
    Myquestion(q: "There are 4 lungs in the human body", a: false),
    Myquestion(q: "Jack fruit is a vegetable", a: false),
    Myquestion(q: "183*124*0=22692", a: false),
  ];

  void nextquestion() {
    if (questionnumber < questionsbank.length - 1) {
      questionnumber++;
    }
  }

  String? questiontext() {
    return questionsbank[questionnumber].question;
  }

  bool? correctanswer() {
    return questionsbank[questionnumber].answer;
  }

  bool? finished() {
    if (questionnumber >= questionsbank.length - 1) {
      print("finished");
      return true;
    } else {
      return false;
    }
  }

  int reset() {
    return questionnumber = 0;
  }

  void checkanswer(bool userpickedanswer) {
    bool? ans = correctanswer();
    setState(() {
      if (finished() == true) {
        Alert(context: context, title: "finished", desc: "game over").show();
        reset();
        symbol = [];
      } else {
        if (userpickedanswer == correctanswer()) {
          symbol.add(
            Icon(
              Icons.check,
              color: Colors.green,
              size: 50,
            ),
          );
        } else {
          symbol.add(
            Icon(
              Icons.close,
              color: Colors.red,
              size: 50,
            ),
          );
        }
        nextquestion();
      }
    });
  }

  // "elephant have black horn",
  // "china is neighbour country of india",
  // "There are 4 lungs in the human body",
  // "Jack fruit is a vegetable",
  // "India got independence on August 15, 1947",
  // "Fish live in water",
  // "An ant can lift 2000 times its body weight",
  // "183*124*0=22692","The train travels in the rail"

  @override
  Widget build(BuildContext context) {
    return //MaterialApp(
    //  debugShowCheckedModeBanner: false,
      Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(0)),
                    color: Colors.black45),
                height: 350,
                width: double.maxFinite,
                child: Center(
                    child: Text(
                  "${questionsbank[questionnumber].question}",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        checkanswer(true);
                        if (questionsbank[questionnumber].answer == true) {}
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(0)),
                          color: Colors.green),
                      height: 50,
                      width: double.maxFinite,
                      child: Center(
                          child: Text(
                        "True",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(10),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        checkanswer(false);
                        if (questionsbank[questionnumber].answer == false) {}
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(0)),
                          color: Colors.redAccent),
                      height: 50,
                      width: double.maxFinite,
                      child: Center(
                          child: Text(
                        "False",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )),
                    ),
                  ),
                ),
                Row(
                  children: symbol,
                ),
                //
                //  Row(
                //    children: [
                //      symbol,
                // //     Icon(Icons.check,color: Colors.green,size:50,),
                // //     Icon(Icons.check,color: Colors.green,size:50,),
                // //
                // //
                //   ],
                //  ),
              ],
            )
          ],
        ),

    );
  }
}
