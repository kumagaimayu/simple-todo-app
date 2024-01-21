import 'package:flutter/material.dart';
import 'package:test_project/next_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String text = '次へ';
  String name = '名前';
  final myFocusNode = FocusNode();
  final myController = TextEditingController();
  final items = ['sakai1', 'sakai2', 'sakai3'];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sakai'),
      ),
      body: Container(
        width: double.infinity,
        child: ListView(
          // This next line does the trick.
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Container(
              width: 160,
              height: 80,
              color: Colors.red,
            ),
            Container(
              width: 160,
              height: 80,
              color: Colors.blue,
            ),
            Container(
              width: 160,
              height: 80,
              color: Colors.orange,
            ),
          ],
        ),
      ),
    );
  }
}
