import 'package:flutter/material.dart';
import 'pages/ConversationPageList.dart';

void main() => runApp(Blabla());

class Blabla extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BlaBla',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ConversationPageList(),
    );
  }
}