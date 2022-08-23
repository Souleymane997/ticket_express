import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ticket_express/widgets/screens/ticket.dart';
import 'package:ticket_express/widgets/screens/trajet.dart';

import '../models/custom_text.dart';
import '../theme/color.dart';
import 'screens/compagnie.dart';
import 'screens/dashbord.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  bool exit = true;

  var screens = [
    const Dashbord(),
    const CompagniePage(),
    const Ticket(),
    const TrajetPage(),
  ];

  int id = 0;

  @override
  void initState() {
    _selectedIndex = 0;

    screens = [
      const Dashbord(),
      const CompagniePage(),
      const Ticket(),
      const TrajetPage(),
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_selectedIndex == 0) {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return AlertDialog(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0))),
                  contentPadding: const EdgeInsets.only(top: 10.0),
                  content: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding:
                              const EdgeInsets.fromLTRB(10.0, 5.0, 5.0, 10.0),
                          child: Row(
                            children: [
                              Flexible(
                                child: CustomText(
                                  " Quitter l'application Ticket Express ? ",
                                  tex: TailleText(context).soustitre,
                                  color: Colors.teal,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]),
                  actions: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5.0, vertical: 1.0),
                          primary: Colors.white,
                          onPrimary: Colors.white,
                          shadowColor: Colors.teal,
                          elevation: 3.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3.0),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context, false);
                          setState(() {
                            exit = false;
                          });
                        },
                        child: CustomText(
                          "NON",
                          color: Colors.teal,
                          tex: TailleText(context).contenu,
                        )),
                    const SizedBox(width: 7.5),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5.0, vertical: 1.0),
                          primary: Colors.teal,
                          onPrimary: Colors.white,
                          shadowColor: Colors.teal,
                          elevation: 3.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3.0),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context, true);
                          SystemNavigator.pop();
                          setState(() {
                            exit = true;
                          });
                        },
                        child: CustomText(
                          "OUI",
                          color: Colors.white,
                          tex: TailleText(context).contenu,
                        )),
                    const SizedBox(width: 2.5),
                  ],
                );
              });
          return exit;
        } else {
          setState(() {
            _selectedIndex = 0;
          });
          return false;
        }
      },
      child: SafeArea(
        child: Scaffold(
          body: IndexedStack(index: _selectedIndex, children: screens),
          bottomNavigationBar: barNavigationBottom(),
        ),
      ),
    );
  }

  Widget barNavigationBottom() {
    return BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        enableFeedback: true,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 13,
        unselectedFontSize: 10,
        showUnselectedLabels: false,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/images/home.png"),
              size: 30,
            ),
            label: "Accueil",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/images/bus.png"),
              size: 30,
            ),
            label: "Compagnies",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/images/tickettt.png"),
              size: 30,
            ),
            label: 'Ticket',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/images/map.png"),
              size: 30,
            ),
            label: 'Trajet',
          ),
        ]);
  }
}
