import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ticket_express/models/custom_text.dart';
import 'package:ticket_express/widgets/screens/navDrawer.dart';
import 'package:ticket_express/widgets/screens/search.dart';
import '../../models/slidepage.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Dashbord extends StatefulWidget {
  const Dashbord({Key? key}) : super(key: key);

  @override
  State<Dashbord> createState() => _DashbordState();
}

class _DashbordState extends State<Dashbord> {
  late SharedPreferences saveDataConnect;
  int choix = 0;

  TimeOfDay time = const TimeOfDay(hour: 10, minute: 30);
  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  final depart = ['Ouagadougou', 'Bobo dioulasso', 'Ziniare', 'Manga'];
  final destination = ['Ouagadougou', 'Bobo dioulasso', 'Ziniare', 'Manga'];
  String value = 'Ouagadougou';
  String value1 = 'Bobo dioulasso';

  loadData() async {
    saveDataConnect = await SharedPreferences.getInstance();
    setState(() {
      choix = saveDataConnect.getInt('login')!;
    });
    debugPrint(" choix = $choix");
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
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.search,
                ),
                onPressed: () async {
                  debugPrint("hello");
                  searchDialogue();
                },
              ),
            ],
            floating: true,
            title: getAppBar(),
            expandedHeight: 325,
            flexibleSpace: FlexibleSpaceBar(
                background: Container(
              margin: const EdgeInsets.all(10),
              child: getCaroussel(),
            )),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              buildCompagnie(),
              Container(height: 10.0),
              const Divider(
                color: Colors.teal,
                indent: 20,
                endIndent: 20,
              ),
              Container(height: 10.0),
              buildDervice(),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
          Navigator.of(context).push(
            SlideRightRoute(
                child: const SearchPage(),
                page: const SearchPage(),
                direction: AxisDirection.left),
          );
        },
        elevation: 10.0,
        backgroundColor: Colors.lightGreenAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
        child: const Icon(
          Icons.airplane_ticket,
          color: Colors.teal,
          size: 30,
        ),
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

  Widget getCaroussel() {
    return ListView(children: [
      Container(
        height: 30,
      ),
      const Divider(
        color: Colors.white,
        thickness: 1,
      ),
      Container(
        height: 10,
      ),
      CarouselSlider(
        options: CarouselOptions(
          enlargeCenterPage: true,
          height: 230,
          autoPlay: true,
          aspectRatio: 16 / 9,
          autoPlayCurve: Curves.fastOutSlowIn,
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          viewportFraction: 0.8,
        ),
        items: [
          getContainerCaroussel(
              'assets/caroussel/compagnies.jpeg',
              "Cliquer et Voyager",
              "plus de soucis pour vos voyage , choississez une compagnie"),
          getContainerCaroussel(
              'assets/caroussel/slide1.jpeg',
              "Cliquer et Voyager",
              "plus de soucis pour vos voyage , choississez une compagnie"),
          getContainerCaroussel(
              'assets/caroussel/slide2.jpeg',
              "Cliquer et Voyager",
              "plus de soucis pour vos voyage , choississez une compagnie"),
          getContainerCaroussel(
              'assets/caroussel/slide3.jpeg',
              "Cliquer et Voyager",
              "plus de soucis pour vos voyage , choississez une compagnie"),
          getContainerCaroussel(
              'assets/caroussel/slide4.jpeg',
              "Cliquer et Voyager",
              "plus de soucis pour vos voyage , choississez une compagnie"),
        ],
      )
    ]);
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
        width: MediaQuery.of(context).size.width * 0.75,
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
                    "Meilleures Compagnies",
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
            const SizedBox(
              height: 5,
            ),
          ]),
    ));
  }

  buildDervice() {
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
                child: Center(
                  child: CustomText(
                    "Services",
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    tex: 1.25,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.transparent,
                      border: Border.all(color: Colors.teal, width: 1),
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 5,
                        ),
                        const Icon(
                          Icons.airplanemode_active,
                          color: Colors.teal,
                          size: 30,
                        ),
                        CustomText(
                          "Reservation de ticket",
                          color: Colors.black87,
                          tex: 0.85,
                          fontWeight: FontWeight.bold,
                        ),
                        Container(
                          height: 3.0,
                        ),
                        const Divider(
                          color: Colors.grey,
                          endIndent: 10,
                          indent: 10,
                        ),
                        Container(
                          height: 8.0,
                        ),
                        const Text(
                          "Reserver votre ticket dans les meilleurs compagnies de transport du pays à travers notre plateforme web ou notre application mobile.",
                          style: TextStyle(
                            color: Colors.black87,
                          ),
                          textAlign: TextAlign.center,
                          softWrap: true,
                          textScaleFactor: 0.75,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 10,
                  ),
                  Container(
                    height: 150,
                    width: 150,
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.transparent,
                      border: Border.all(color: Colors.teal, width: 1),
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 5,
                        ),
                        const Icon(
                          Icons.map,
                          color: Colors.teal,
                          size: 30,
                        ),
                        CustomText(
                          "Envoi & Suivi de colis",
                          color: Colors.black87,
                          tex: 0.85,
                          fontWeight: FontWeight.bold,
                        ),
                        Container(
                          height: 3.0,
                        ),
                        const Divider(
                          color: Colors.grey,
                          endIndent: 10,
                          indent: 10,
                        ),
                        Container(
                          height: 8.0,
                        ),
                        const Text(
                          "Nous vous permettons de suivre votre colis jusqu'à la destination à partir de l'application mobile ou de la plateforme web.",
                          style: TextStyle(
                            color: Colors.black87,
                          ),
                          textAlign: TextAlign.center,
                          softWrap: true,
                          textScaleFactor: 0.75,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 10,
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
            ]),
      ),
    );
  }

  Future<void> searchDialogue() async {
    return await showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) => StatefulBuilder(
            builder: (context, setState) => SimpleDialog(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  contentPadding: const EdgeInsets.only(top: 5.0),
                  backgroundColor: Colors.white,
                  title: CustomText(
                    "Trouver votre Compagnie",
                    color: Colors.teal,
                    fontWeight: FontWeight.bold,
                    tex: TailleText(context).titre,
                    textAlign: TextAlign.center,
                  ),
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.275,
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Column(
                        children: [
                          const Divider(
                            color: Colors.teal,
                            indent: 40,
                            endIndent: 40,
                          ),
                          Column(
                            children: [
                              const SizedBox(
                                height: 15,
                              ),
                              Container(
                                  padding: const EdgeInsets.only(left: 30),
                                  height: 40,
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(50)),
                                  child: DropdownButton<String>(
                                      underline: Container(),
                                      icon: const Icon(Icons.arrow_drop_down,
                                          color: Colors.blueGrey),
                                      value: value,
                                      isExpanded: true,
                                      items: depart.map(buildMenuItem).toList(),
                                      iconSize: 30,
                                      iconEnabledColor: Colors.blueGrey,
                                      onChanged: ((value) {
                                        setState(() {
                                          this.value = value!;
                                        });
                                      }))),
                              const SizedBox(
                                height: 15,
                              ),
                              Container(
                                  padding: const EdgeInsets.only(left: 30),
                                  height: 40,
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(50)),
                                  child: DropdownButton<String>(
                                      underline: Container(),
                                      icon: const Icon(Icons.arrow_drop_down,
                                          color: Colors.blueGrey),
                                      value: value1,
                                      isExpanded: true,
                                      items: destination
                                          .map(buildMenuItem)
                                          .toList(),
                                      iconSize: 30,
                                      iconEnabledColor: Colors.blueGrey,
                                      onChanged: ((value) {
                                        setState(() {
                                          this.value = value!;
                                        });
                                      }))),
                              const SizedBox(
                                height: 15,
                              ),
                              InkWell(
                                onTap: () async {
                                  TimeOfDay? newTime = await showTimePicker(
                                    context: context,
                                    initialTime: time,
                                  );

                                  if (newTime != null) {
                                    setState(() {
                                      time = newTime;
                                      dateController.text =
                                          "        ${time.hour} : ${time.minute}";
                                    });
                                  }
                                },
                                child: Container(
                                  height: 40,
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(50)),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: Container(
                                        padding:
                                            const EdgeInsets.only(left: 30),
                                        child: CustomText(
                                          "${time.hour} : ${time.minute}",
                                          color: Colors.black87,
                                          textAlign: TextAlign.left,
                                        ),
                                      )),
                                      IconButton(
                                        icon:
                                            const Icon(Icons.alarm_on_rounded),
                                        onPressed: () async {
                                          TimeOfDay? newTime =
                                              await showTimePicker(
                                            context: context,
                                            initialTime: time,
                                          );

                                          if (newTime != null) {
                                            setState(() {
                                              time = newTime;
                                              dateController.text =
                                                  "        ${time.hour} : ${time.minute}";
                                            });
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: SizedBox(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 15.0),
                              primary: Colors.teal,
                              onPrimary: Colors.white,
                              shadowColor: Colors.teal.shade300,
                              elevation: 3.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.of(context).push(
                                SlideRightRoute(
                                    child: const SearchPage(),
                                    page: const SearchPage(),
                                    direction: AxisDirection.left),
                              );
                            },
                            child: CustomText(
                              "rechercher",
                              color: Colors.white,
                              tex: 0.8,
                            )),
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                )));
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: CustomText(
        item,
        color: Colors.black87,
        textAlign: TextAlign.center,
      ));
}
