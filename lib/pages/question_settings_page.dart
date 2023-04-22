import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class QuestionSettingsPage extends ConsumerWidget {
  const QuestionSettingsPage({super.key, required this.databaseName});
  final String databaseName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  databaseName,
                  style: const TextStyle(
                      fontFamily: 'neue-machina',
                      fontWeight: FontWeight.w900,
                      fontSize: 84),
                ),
                const Text('exam questions',
                    style: TextStyle(fontFamily: 'neue-machina', fontSize: 42))
              ],
            ),
          ),
        ],
      )),
    );
  }
}
