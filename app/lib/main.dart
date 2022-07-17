import "package:flutter/material.dart";
import 'Homepage.dart';

void main() => runApp(Myapp());

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "todo app",
      theme: ThemeData(primarySwatch: Colors.green),
      home: Homepage(),
    );
  }
}
