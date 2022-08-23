import 'package:flutter/material.dart';
import '../../models/custom_text.dart';

class Ticket extends StatefulWidget {
  const Ticket({Key? key}) : super(key: key);

  @override
  State<Ticket> createState() => _TicketState();
}

class _TicketState extends State<Ticket> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.teal,
        title: CustomText(
          " Mes Tickets ",
          tex: TailleText(context).titre,
          fontWeight: FontWeight.normal,
        ),
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                height: 10,
              ),
              CustomText(
                " Mes Derniers tickets ",
                color: Colors.teal,
                tex: TailleText(context).titre,
                fontWeight: FontWeight.w600,
              ),
              Container(height: 10.0),
            ]),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return cardElement(index);
              },
              childCount: 10, // 1000 list items
            ),
          ),
        ],
      ),
    );
  }

  Widget cardElement(int x) {
    return Card(
      elevation: 8.0,
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: const BorderSide(
          color: Colors.white,
        ),
      ),
      child: Container(
          //padding: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
                colors: [
                  Colors.teal,
                  Colors.lightGreen,
                ],
                begin: FractionalOffset(0.0, 0.0),
                end: FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.transparent,
              width: 1,
            ),
          ),
          //
          height: 130,
          child: InkWell(
            onTap: () {
              debugPrint("hello");
            },
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 5),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Ticket N° 00 0${x + 1} ",
                        textScaleFactor: 1.5,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  const Divider(
                    color: Colors.white,
                    thickness: 1.0,
                    height: 1.0,
                    endIndent: 10,
                    indent: 10,
                  ),
                  Container(
                    height: 5.0,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Compagnie  : TSR ",
                            textScaleFactor: 1.1,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Container(
                          height: 5,
                        ),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Car                 : 005 ",
                            textScaleFactor: 1.1,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 3.0,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 5),
                    margin: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                    child: Column(
                      children: [
                        const Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Date d'achat :  12 janvier 2022 à 19 h 30 ",
                            textScaleFactor: 0.75,
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Container(
                          height: 3,
                        ),
                        const Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Date de depart :  15 janvier 2022 ,  10 h 30 ",
                            textScaleFactor: 0.75,
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
