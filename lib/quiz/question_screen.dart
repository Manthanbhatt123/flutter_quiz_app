import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_demo/data/question.dart';
import 'package:quiz_demo/style/answers_button.dart';

// ignore: must_be_immutable
class QuestionScreen extends StatefulWidget {
   QuestionScreen({super.key,required this.onSelectedAnswer});

  void Function(String answer) onSelectedAnswer;
  @override
  State<StatefulWidget> createState() {
    return _QuestionState();
  }
}

class _QuestionState extends State<QuestionScreen> {



  var currentQuestionIndex = 0;

  onClickAnswer(String selectedAnswer){
    widget.onSelectedAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {

    final currentQuestion = question[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
                currentQuestion.text,
                style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 177, 161, 243),
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
                textAlign:TextAlign.center),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswer().map((answer){
              return AnswerButton(
                  answer: answer,
                  onClick: (){
                    onClickAnswer(answer);
              });
            }),
          ],
        ),
      ),
    );
  }
}
