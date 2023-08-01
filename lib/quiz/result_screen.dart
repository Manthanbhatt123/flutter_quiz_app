import 'package:flutter/material.dart';
import 'package:quiz_demo/data/question.dart';
import 'package:quiz_demo/quiz/questions_summary.dart';

class ResultScreen extends StatelessWidget{
  const ResultScreen({super.key, required this.chosenAnswer});

  final List<String> chosenAnswer;

  List<Map<String,Object>> getSummaryData(){
    final List<Map<String,Object>> summary = [];

    for(var i=0;i<chosenAnswer.length;i++){
      summary.add({
        'question_index': i,
        'question': question[i].text,
        'correct_answer':question[i].answer[0],
        'user_answer':chosenAnswer[i]
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final totalQuestions = question.length;
    final correctAnswers = summaryData.where((data){
      return data['user_answer'] == data['correct_answer'];
    }).length;



    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You Answered $correctAnswers out of $totalQuestions questions correctly'),
            const SizedBox(height: 30,),
            QuestionSummary(summaryData),
            const SizedBox(height: 30,),
            TextButton(onPressed: (){}, child:const Text('Restart'))
          ],
        ),
      ),
    );
  }
}