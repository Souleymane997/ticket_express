import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CompagniePage extends StatefulWidget {
  const CompagniePage({Key? key}) : super(key: key);

  @override
  State<CompagniePage> createState() => _CompagniePageState();
}

class _CompagniePageState extends State<CompagniePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text("Compagnie"),
        ),
      ),
    );
  }
}