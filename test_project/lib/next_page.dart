import 'package:flutter/material.dart';

class NextPage extends StatelessWidget {
  NextPage(this.name);
  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('次の画面'),
      ),
      body: Container(
        height: double.infinity,
        color: Colors.red,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Text(name),
            Center(
              child: ElevatedButton(
                child: const Text('戻る'),
                onPressed: (){
                  // 押すと実行されるアクション
                  Navigator.pop(context, 'Saiko');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}