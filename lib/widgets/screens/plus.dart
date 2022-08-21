import 'package:flutter/material.dart';

class Plus extends StatefulWidget {
  const Plus({Key? key}) : super(key: key);

  @override
  State<Plus> createState() => _PlusState();
}

class _PlusState extends State<Plus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text("plus"),
        ),
      ),
    );
  }
}