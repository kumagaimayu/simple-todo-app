import 'package:flutter/material.dart';
import 'edit.dart';
import 'task_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'メモ！',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF8c7042)),
        useMaterial3: true,
      ),
      home: const MemoListPage(title: 'メモ一覧'),
    );
  }
}

class MemoListPage extends StatefulWidget {
  const MemoListPage({super.key, required this.title});
  final String title;

  @override
  State<MemoListPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MemoListPage> {
  int _counter = 0;

  void _addMemo() {
    // 画面の更新
    setState(() {
      var taskModel = Task(taskName, false);
      taskList.add(taskModel);
      print(taskList.toString());
      _controller.clear();
    });
  }

  void _deleteMemo(int index) {
    // 画面の更新
    setState(() {
      taskList.removeAt(index);
    });
  }

  List<Task> taskList = [];
  double fontSize = 20.0;
  String taskName = "";
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tasks")),
      body: Column(children: [
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) => GestureDetector(
              child: Row(
                children: [
                  Checkbox(
                    value: taskList[index].isDone,
                    onChanged: (value) {
                      setState(() {
                        taskList[index].isDone = !taskList[index].isDone;
                      });
                    },
                  ),
                  Expanded(
                    child: Text(
                      taskList[index].taskName,
                      style: TextStyle(
                        color: Colors.brown,
                      ),
                    ),
                  ),
                ],
              ),
              onTap: () async {
                var result = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EditPage(taskList[index])),
                );
                setState(() {
                  taskList[index] = result;
                });
              },
            ),
            separatorBuilder: (context, index) {
              return const Divider(height: 0.5);
            },
            itemCount: taskList.length,
          ),
        ),
        Spacer(),
        Padding(
          padding: EdgeInsets.all(26),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    labelText: 'Enter your tasks',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    taskName = value;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: ElevatedButton(
                  onPressed: _addMemo,
                  child: const Icon(Icons.add),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
