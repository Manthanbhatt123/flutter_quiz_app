import 'package:flutter/material.dart';


class AnswerButton extends StatelessWidget{
  const AnswerButton({super.key,required this.answer, required this.onClick});

  final String answer;
  final void Function() onClick;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(

      onPressed: onClick,

      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 10),
        backgroundColor: const Color.fromARGB(255, 33, 1, 95),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        elevation: 5,
        shadowColor: Colors.amber
      ),

      child: Text(answer,textAlign: TextAlign.center,));
  }

}