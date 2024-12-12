import 'package:dialog_question/dialog_quesion.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ToDoListApp(),
    );
  }
}

class ToDoListApp extends StatelessWidget {
  const ToDoListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return

      DialogQuestionTest();

      // bottomNavigationBar: BottomRegisterButtonWidget(),
  }
}
