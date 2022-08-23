import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/custom_text.dart';
import 'home.dart';
import 'screens/login.dart';

class Launch extends StatefulWidget {
  const Launch({Key? key}) : super(key: key);

  @override
  State<Launch> createState() => _LaunchState();
}

class _LaunchState extends State<Launch> {
  late SharedPreferences saveDataConnect;
  late int choix;

  void checkLogin() async {
    saveDataConnect = await SharedPreferences.getInstance();

    choix = (saveDataConnect.getInt('login') ?? 0);
    debugPrint("$choix");

    if (choix == 1) {
      Timer(
          const Duration(seconds: 3),
          () => {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const HomePage()))
              });
    } else {
      Timer(
          const Duration(seconds: 3),
          () => {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()))
              });
    }
  }

  @override
  void initState() {
    checkLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.teal,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/logot.jpeg'),
                        fit: BoxFit.contain,
                      )),
                ),
                Container(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      "TICKET",
                      color: Colors.lightGreenAccent,
                      tex: TailleText(context).titre * 1.5,
                      fontWeight: FontWeight.w700,
                    ),
                    Container(
                      width: 10,
                    ),
                    CustomText(
                      "EXPRESS",
                      color: Colors.white,
                      tex: TailleText(context).titre * 1.5,
                      fontWeight: FontWeight.w700,
                    ),
                  ],
                ),
                Container(height: 6.0),
                CustomText(
                  "reservation plus simple",
                  tex: TailleText(context).contenu,
                ),
                Container(height: MediaQuery.of(context).size.height * 0.18),
                const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                )
              ],
            )),
          ),
        ),
      ),
    );
  }

  progressCircular() async {
    Timer(
        const Duration(milliseconds: 50),
        () => {
              const CircularProgressIndicator(
                color: Colors.white,
              ),
            });
  }
}
