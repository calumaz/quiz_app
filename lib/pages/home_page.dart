import 'package:flutter/material.dart';
import 'test_page.dart';

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
                          builder: (context) => const TestPage(
                                boxName: 'fourAQuestionBox',
                              )));
                },
                child: const Text('4A questions')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const TestPage(boxName: 'fourBQuestionBox')));
                },
                child: const Text('4B questions')),
          ]))),
    );
  }
}
