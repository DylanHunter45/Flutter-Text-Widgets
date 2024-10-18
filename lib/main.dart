import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blog App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Text Widgets')), body: TextInputWidgit());
  }
}

class TextInputWidgit extends StatefulWidget {
  const TextInputWidgit({super.key});

  @override
  State<TextInputWidgit> createState() => _TextInputWidgitState();
}

class _TextInputWidgitState extends State<TextInputWidgit> {
  final controller = TextEditingController();
  String text = "";

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void changeText(text) {
    if (text == "Clear Text") {
      controller.clear();
      text = "";
    }
    setState(() {
      this.text = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      TextField(
        controller: controller,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.message_sharp),
            labelText: "Type a message:"),
        onChanged: (text) => changeText(text),
      ),
      Text(text)
    ]);
  }
}
