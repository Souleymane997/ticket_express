import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/custom_text.dart';
import 'navDrawer.dart';

class CompagniePage extends StatefulWidget {
  const CompagniePage({Key? key}) : super(key: key);

  @override
  State<CompagniePage> createState() => _CompagniePageState();
}

class _CompagniePageState extends State<CompagniePage> {
  late SharedPreferences saveDataConnect;
  int choix = 0;

  loadData() async {
    saveDataConnect = await SharedPreferences.getInstance();
    choix = saveDataConnect.getInt('login')!;
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: NavDrawer(
        choix: choix,
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.teal,
            pinned: true,
            snap: true,
            floating: true,
            title: getAppBar(),
            expandedHeight: 325,
            flexibleSpace: FlexibleSpaceBar(
                background: Container(
              margin: const EdgeInsets.all(3),
              child: getContainerCaroussel('assets/caroussel/compagnies.jpeg',
                  " - Vos Compagnies -", "Les meilleures Compagnies "),
            )),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              buildCompagnie(),
              Container(height: 10.0),
            ]),
          ),
          SliverFixedExtentList(
            itemExtent: 80.0,
            delegate: SliverChildListDelegate(
              [
                Container(color: Colors.white),
                Container(color: Colors.white),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getAppBar() {
    return Row(
      children: [
        CustomText(
          "TICKET",
          color: Colors.lightGreenAccent,
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
    );
  }

  Widget getContainerCaroussel(String path, String titre, String sousTitre) {
    return Card(
      elevation: 2.0,
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: const BorderSide(
          color: Colors.white,
        ),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
              image: AssetImage(path),
              fit: BoxFit.fill,
            )),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black87.withOpacity(0.35),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomText(
                  titre, //
                  color: Colors.white,
                  tex: 1.6,
                  fontWeight: FontWeight.bold,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(2.0, 15.0, 2.0, 0.0),
                  child: CustomText(
                    sousTitre, //,
                    color: Colors.white,
                    tex: 1.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ]),
        ),
      ),
    );
  }

  buildCompagnie() {
    return SingleChildScrollView(
        child: Container(
      width: MediaQuery.of(context).size.width * 0.9,
      color: Colors.transparent,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.only(left: 8, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    "Vos Compagnies ",
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    tex: 1.25,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(children: [
                      Container(
                        height: 150,
                        width: 150,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: const DecorationImage(
                            image: AssetImage('assets/caroussel/ect.jpeg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      CustomText(
                        " -- TCV --",
                        color: Colors.teal,
                        tex: 0.9,
                        fontWeight: FontWeight.bold,
                      ),
                    ]),
                    Column(children: [
                      Container(
                        height: 150,
                        width: 150,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: const DecorationImage(
                            image: AssetImage('assets/caroussel/ect.jpeg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      CustomText(
                        " -- SARAMAYA --",
                        color: Colors.teal,
                        tex: 0.9,
                        fontWeight: FontWeight.bold,
                      ),
                    ]),
                  ],
                ),
                Container(
                  height: 10,
                ),
                const Divider(
                  color: Colors.teal,
                  indent: 20,
                  endIndent: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(children: [
                      Container(
                        height: 150,
                        width: 150,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: const DecorationImage(
                            image: AssetImage('assets/caroussel/ect.jpeg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      CustomText(
                        " -- TSR --",
                        color: Colors.teal,
                        tex: 0.9,
                        fontWeight: FontWeight.bold,
                      ),
                    ]),
                    Column(children: [
                      Container(
                        height: 150,
                        width: 150,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: const DecorationImage(
                            image: AssetImage('assets/caroussel/ect.jpeg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      CustomText(
                        " -- Ellispsis --",
                        color: Colors.teal,
                        tex: 0.9,
                        fontWeight: FontWeight.bold,
                      ),
                    ]),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
          ]),
    ));
  }
}
