import 'package:flutter/material.dart';
import 'package:ticket_express/models/custom_text.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.teal,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
          title: CustomText(
            "Recherche Compagnie",
            tex: TailleText(context).titre,
            fontWeight: FontWeight.normal,
          ),
        ),
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate([
                buildCompagnie(),
                Container(height: 10.0),
              ]),
            ),
          ],
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
                    "Meilleurs Resultats ",
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    tex: 1.25,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.teal,
                        onPrimary: Colors.white,
                        shadowColor: Colors.teal.shade300,
                        elevation: 3.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      onPressed: () {},
                      child: CustomText(
                        "Tous les departs",
                        color: Colors.white,
                        tex: 0.7,
                      )),
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
                        "Ouaga Bobo Standard Gare 1",
                        color: Colors.black87,
                        tex: 0.75,
                      ),
                      CustomText(
                        " 2500.0 FCFA",
                        color: Colors.teal,
                        tex: 0.9,
                        fontWeight: FontWeight.bold,
                      )
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
                        "Ouaga Bobo Standard Gare 1",
                        color: Colors.black87,
                        tex: 0.75,
                      ),
                      CustomText(
                        " 2500.0 FCFA",
                        color: Colors.teal,
                        tex: 0.9,
                        fontWeight: FontWeight.bold,
                      )
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
                        "Ouaga Bobo Standard Gare 1",
                        color: Colors.black87,
                        tex: 0.75,
                      ),
                      CustomText(
                        " 2500.0 FCFA",
                        color: Colors.teal,
                        tex: 0.9,
                        fontWeight: FontWeight.bold,
                      )
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
                        "Ouaga Bobo Standard Gare 1",
                        color: Colors.black87,
                        tex: 0.75,
                      ),
                      CustomText(
                        " 2500.0 FCFA",
                        color: Colors.teal,
                        tex: 0.9,
                        fontWeight: FontWeight.bold,
                      )
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
                        "Ouaga Bobo Standard Gare 1",
                        color: Colors.black87,
                        tex: 0.75,
                      ),
                      CustomText(
                        " 2500.0 FCFA",
                        color: Colors.teal,
                        tex: 0.9,
                        fontWeight: FontWeight.bold,
                      )
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
                        "Ouaga Bobo Standard Gare 1",
                        color: Colors.black87,
                        tex: 0.75,
                      ),
                      CustomText(
                        " 2500.0 FCFA",
                        color: Colors.teal,
                        tex: 0.9,
                        fontWeight: FontWeight.bold,
                      )
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
