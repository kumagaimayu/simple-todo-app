import 'package:flutter/material.dart';
import 'task_model.dart';
import 'package:sqflite/sqflite.dart';

class EditPage extends StatelessWidget {
  // コンストラクタ
  EditPage(Task task) {
    this.task = task;
    _controller = TextEditingController(text: task.taskName);
  }

  late Task task;
  TextEditingController? _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit'),
      ),
      body: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: _controller,
              onChanged: (String value) {
                task.taskName = value;
              },
            ),
          ),
          ElevatedButton(
            onPressed: ()  {
            Navigator.of(context).pop(task);
            },
            child: Text(
              "Complete",
              style: TextStyle(color: Colors.brown),
            ),
          ),
        ],
      ),
    );

    void _editComplete() {
      // taskNameの変更, main画面遷移
    }
  }
}
