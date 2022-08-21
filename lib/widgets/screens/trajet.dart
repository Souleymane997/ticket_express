import 'package:flutter/material.dart';

class TrajetPage extends StatefulWidget {
  const TrajetPage({Key? key}) : super(key: key);

  @override
  State<TrajetPage> createState() => _TrajetPageState();
}

class _TrajetPageState extends State<TrajetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text("trajet"),
        ),
      ),
    );
  }
}
