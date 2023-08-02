import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 12,
                  backgroundColor: (data['user_answer'].toString() ==
                          data['correct_answer'].toString())
                      ? const Color.fromARGB(255, 37, 136, 208)
                      : const Color.fromARGB(255, 219, 99, 252),
                  child: Text(
                    ((data['question_index'] as int) + 1).toString(),
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['question'] as String,
                          style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 197, 183, 236)),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          data['user_answer'] as String,
                          style: const TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 224, 109, 232)),
                        ),
                        Text(
                          data['correct_answer'] as String,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 125, 154, 255)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
