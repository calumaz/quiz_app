import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_app/models/question_model.dart';




class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(context, ref) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: const [
        Text('Settings Page'),
      ],
    )));
  }
}
