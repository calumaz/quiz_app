import 'package:flutter/material.dart';
import 'four_a_test_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FourATestPage()));
                },
                child: const Text('4A questions')),
            ElevatedButton(onPressed: () {}, child: const Text('4B questions')),
          ]))),
    );
  }
}

// return Scaffold(
//   body: SafeArea(
//     child: Center(
//         child: FutureBuilder(
//       future: getAllQuestions(fourAQuestionBox),
//       builder: (BuildContext context, AsyncSnapshot snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (snapshot.hasData) {
//           List<QuestionModel> questions = snapshot.data!;
//           return ListView.builder(
//               itemCount: questions.length,
//               itemBuilder: (context, index) {
//                 QuestionModel question = questions[index];
//                 return ListTile(
//                   title: Text(question.question),
//                   subtitle: Text(question.answers.join(', ')),
//                   trailing: Text(
//                       'Correct answer index: ${question.correctAnswerIndex}'),
//                 );
//               });
//         } else if (snapshot.hasError) {
//           return const Center(child: Text('Error loading data'));
//         } else {
//           return const Center(child: Text('No data found'));
//         }
//       },
//     )),
//   ),
// );