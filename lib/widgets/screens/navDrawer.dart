import 'package:flutter/material.dart';
import 'package:ticket_express/widgets/menu/apropos.dart';
import 'package:ticket_express/widgets/menu/contact.dart';
import 'package:ticket_express/widgets/menu/profil.dart';
import 'package:ticket_express/widgets/screens/login.dart';
import '../../models/custom_text.dart';
import '../../models/slidepage.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({Key? key, required this.choix}) : super(key: key);
  final int choix;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.75,
      child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.teal,
            ),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      CustomText(
                        "TICKET",
                        color: Colors.green,
                        tex: 1.3,
                        textAlign: TextAlign.left,
                      ),
                      Container(
                        width: 5,
                      ),
                      CustomText(
                        "EXPRESS",
                        color: Colors.white,
                        tex: 1.3,
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  Container(
                    height: 10,
                  ),
                  Row(
                    children: const [
                      Expanded(
                        // ignore: sort_child_properties_last
                        child: Icon(
                          Icons.account_circle,
                          color: Colors.white,
                          size: 40,
                        ),
                        flex: 2,
                      ),
                      Expanded(
                        flex: 6,
                        child: Text(
                          "Mon Compte",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          (choix == 1)
              ? ListTile(
                  title: const Text("Profile"),
                  leading: const Icon(Icons.account_circle),
                  onTap: () {
                    Navigator.of(context).push(
                      SlideRightRoute(
                          child: const Profil(),
                          page: const Profil(),
                          direction: AxisDirection.right),
                    );
                  },
                )
              : const SizedBox(
                  height: 0.0,
                  width: 0.0,
                ),
          (choix == 1)
              ? const Divider(
                  color: Colors.teal,
                )
              : const SizedBox(
                  height: 0.0,
                  width: 0.0,
                ),
          (choix == 1)
              ? ListTile(
                  title: const Text("Contacts"),
                  leading: const Icon(Icons.contact_page),
                  onTap: () {
                    Navigator.of(context).push(
                      SlideRightRoute(
                          child: const Contact(),
                          page: const Contact(),
                          direction: AxisDirection.right),
                    );
                  },
                )
              : const SizedBox(
                  height: 0.0,
                  width: 0.0,
                ),
          (choix == 1)
              ? const Divider(
                  color: Colors.teal,
                )
              : const SizedBox(
                  height: 0.0,
                  width: 0.0,
                ),
          (choix == 1)
              ? ListTile(
                  title: const Text("A propos"),
                  leading: const Icon(Icons.info),
                  onTap: () {
                    Navigator.of(context).push(
                      SlideRightRoute(
                          child: const Apropos(),
                          page: const Apropos(),
                          direction: AxisDirection.right),
                    );
                  },
                )
              : const SizedBox(
                  height: 0.0,
                  width: 0.0,
                ),
          (choix == 1)
              ? const Divider(
                  color: Colors.teal,
                )
              : const SizedBox(
                  height: 0.0,
                  width: 0.0,
                ),
          (choix == 0)
              ? ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                      SlideRightRoute(
                          child: const LoginPage(),
                          page: const LoginPage(),
                          direction: AxisDirection.right),
                    );
                  },
                  title: const Text("Se connecter"),
                  leading: const Icon(Icons.login),
                )
              : const SizedBox(
                  height: 0.0,
                  width: 0.0,
                ),
          (choix == 0)
              ? const Divider(
                  color: Colors.teal,
                )
              : const SizedBox(
                  height: 0.0,
                  width: 0.0,
                ),
          (choix == 1)
              ? ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                      SlideRightRoute(
                          child: const LoginPage(),
                          page: const LoginPage(),
                          direction: AxisDirection.right),
                    );
                  },
                  title: const Text(
                    "Se deconnecter",
                    style: TextStyle(color: Colors.red),
                  ),
                  leading: const Icon(
                    Icons.login,
                    color: Colors.red,
                  ),
                )
              : const SizedBox(
                  height: 0.0,
                  width: 0.0,
                ),
          (choix == 1)
              ? const Divider(
                  color: Colors.teal,
                )
              : const SizedBox(
                  height: 0.0,
                  width: 0.0,
                ),
        ],
      ),
    );
  }
}
