import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ticket_express/theme/color.dart';
import '../models/custom_text.dart';
import '../models/slidepage.dart';
import 'home.dart';
import 'screens/login.dart';

class Launch extends StatefulWidget {
  const Launch({Key? key}) : super(key: key);

  @override
  State<Launch> createState() => _LaunchState();
}

class _LaunchState extends State<Launch> {
  //late SharedPreferences loginData;
  late bool newUser;

  //* fonction Timer
  startTimer() async {
    Duration duration = const Duration(seconds: 5);
    return Timer(duration, navigatePage);
  }

//* fonction pour changer de page
  void navigatePage() {
    Navigator.of(context).push(
      SlideRightRoute(
          child: const LoginPage(),
          page: const LoginPage(),
          direction: AxisDirection.left),
    );

    // if (newUser) {
    //   Navigator.of(context).push(
    //     SlideRightRoute(
    //         child: const LoginPage(),
    //         page: const LoginPage(),
    //         direction: AxisDirection.left),
    //   );
    // } else {
    //   Navigator.of(context).push(
    //     SlideRightRoute(
    //         child: const HomePage(),
    //         page: const HomePage(),
    //         direction: AxisDirection.left),
    //   );
    // }
  }

  @override
  void initState() {
    //checkLogin();
    startTimer();
    super.initState();
  }

  // void checkLogin() async {
  //   loginData = await SharedPreferences.getInstance();
  //   newUser = (loginData.getBool('login') ?? true);
  // }

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
                CustomText(
                  "Ticket EXPRESS",
                  tex: TailleText(context).titre * 2.1,
                  family: "Captain",
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
