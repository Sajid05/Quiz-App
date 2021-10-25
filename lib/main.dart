import 'package:flutter/material.dart';
import 'package:quiz_app/questions.dart';
import 'questions.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _queindex = 0;

  int showStatus = 1;
  int _totalCorrect = 0;
  late String _status;
  late String _result;

  bool _isButtonDisabled = false;
  bool _isQuizOver = false;
  List<int> options = [1, 1, 1, 1];

  final List<Questions> _questionList = [
    Questions(
      que: "10 + 9 = ?",
      ans: "19",
      options: ["17", "19", "90", "20"],
    ),
    Questions(
      que: "20 * 5 = ?",
      ans: "100",
      options: ["10", "90", "100", "15"],
    ),
    Questions(
      que: "40 - 50 = ?",
      ans: "-10",
      options: ["-10", "60", "10", "15"],
    ),
    Questions(
      que: "16 + 9 = ?",
      ans: "25",
      options: ["8", "90", "25", "32"],
    ),
    Questions(
      que: "15 / 3 = ?",
      ans: "5",
      options: ["45", "5", "30", "10"],
    )
  ];

  optionChosen(String _chosen, int _index) {
    options = [1, 1, 1, 1];
    _isButtonDisabled = true;
    if (_chosen == _questionList[_queindex].ans) {
      showStatus = 2;
      options[_index] = 2;
      _status = "You got it right!";
      _totalCorrect++;
    } else {
      showStatus = 0;
      options[_index] = 0;
      _status = "Ooops! Try the next one";
    }
    setState(() {});
  }

  nextQuiz() {
    _queindex++;
    if (_queindex == 5) {
      _isQuizOver = true;
      _result = "You got " + (_totalCorrect / 5 * 100).toString() + "% correct";
    }
    options = [1, 1, 1, 1];
    _isButtonDisabled = false;
    showStatus = 1;
    setState(() {});
  }

  restart() {
    _queindex = 0;
    _isQuizOver = false;
    _totalCorrect = 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: const Text("Quiz Application"),
          backgroundColor: Colors.blue[800],
        ),
        body: !_isQuizOver
            ? Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                        margin: const EdgeInsets.all(20),
                        padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                        child: Text(_questionList[_queindex].que,
                            style: const TextStyle(
                              color: Colors.white,
                              wordSpacing: 2,
                              fontSize: 15,
                            )),
                        decoration: BoxDecoration(
                          color: Colors.blue[700],
                          borderRadius: BorderRadius.circular(10),
                        )),
                    SizedBox(
                      width: 80,
                      child: ElevatedButton(
                        child: Text(_questionList[_queindex].options[0]),
                        style: options[0] == 0
                            ? ElevatedButton.styleFrom(
                                primary: Colors.red, // background
                                onPrimary: Colors.white,
                                // foreground
                              )
                            : options[0] == 2
                                ? ElevatedButton.styleFrom(
                                    primary: Colors.green, // background
                                    onPrimary: Colors.white,
                                    // foreground
                                  )
                                : ElevatedButton.styleFrom(
                                    primary: Colors.white, // background
                                    onPrimary: Colors.black,
                                    // foreground
                                  ),
                        onPressed: () => !_isButtonDisabled
                            ? optionChosen(
                                _questionList[_queindex].options[0], 0)
                            : null,
                      ),
                    ),
                    SizedBox(
                      width: 80,
                      child: ElevatedButton(
                        child: Text(_questionList[_queindex].options[1]),
                        style: options[1] == 0
                            ? ElevatedButton.styleFrom(
                                primary: Colors.red, // background
                                onPrimary: Colors.white,
                                // foreground
                              )
                            : options[1] == 2
                                ? ElevatedButton.styleFrom(
                                    primary: Colors.green, // background
                                    onPrimary: Colors.white,
                                    // foreground
                                  )
                                : ElevatedButton.styleFrom(
                                    primary: Colors.white, // background
                                    onPrimary: Colors.black,
                                    // foreground
                                  ),
                        onPressed: () => !_isButtonDisabled
                            ? optionChosen(
                                _questionList[_queindex].options[1], 1)
                            : null,
                      ),
                    ),
                    SizedBox(
                      width: 80,
                      child: ElevatedButton(
                        child: Text(_questionList[_queindex].options[2]),
                        style: options[2] == 0
                            ? ElevatedButton.styleFrom(
                                primary: Colors.red, // background
                                onPrimary: Colors.white,
                                // foreground
                              )
                            : options[2] == 2
                                ? ElevatedButton.styleFrom(
                                    primary: Colors.green, // background
                                    onPrimary: Colors.white,
                                    // foreground
                                  )
                                : ElevatedButton.styleFrom(
                                    primary: Colors.white, // background
                                    onPrimary: Colors.black,
                                    // foreground
                                  ),
                        onPressed: () => !_isButtonDisabled
                            ? optionChosen(
                                _questionList[_queindex].options[2], 2)
                            : null,
                      ),
                    ),
                    SizedBox(
                      width: 80,
                      child: ElevatedButton(
                        child: Text(_questionList[_queindex].options[3]),
                        style: options[3] == 0
                            ? ElevatedButton.styleFrom(
                                primary: Colors.red, // background
                                onPrimary: Colors.white,
                                // foreground
                              )
                            : options[3] == 2
                                ? ElevatedButton.styleFrom(
                                    primary: Colors.green, // background
                                    onPrimary: Colors.white,
                                    // foreground
                                  )
                                : ElevatedButton.styleFrom(
                                    primary: Colors.white, // background
                                    onPrimary: Colors.black,
                                    // foreground
                                  ),
                        onPressed: () => !_isButtonDisabled
                            ? optionChosen(
                                _questionList[_queindex].options[3], 3)
                            : null,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    showStatus != 1
                        ? SizedBox(
                            width: 200,
                            child: ElevatedButton(
                              child: Text(_status),
                              style: showStatus == 2
                                  ? ElevatedButton.styleFrom(
                                      primary: Colors.green, // background
                                      onPrimary: Colors.white,
                                      // foreground
                                    )
                                  : ElevatedButton.styleFrom(
                                      primary: Colors.red, // background
                                      onPrimary: Colors.white,
                                      // foreground
                                    ),
                              onPressed: nextQuiz,
                            ),
                          )
                        : const SizedBox(
                            width: 80,
                          )
                  ],
                ),
              )
            : AlertDialog(
                title: const Text("Done!"),
                content: Text(_result),
                actions: [
                  TextButton(
                      onPressed: restart,
                      child: const Text(
                        "Restart Quiz",
                        style: TextStyle(color: Colors.green),
                      ))
                ],
              ));
  }
}
