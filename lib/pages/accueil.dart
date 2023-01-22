import 'package:flutter/material.dart';
import 'package:ma_money/ex.dart';
import 'package:ma_money/model/dette.dart';
import 'package:ma_money/model/user.dart';
import 'package:ma_money/widgets/pages/add_dette.dart';

import 'package:ma_money/widgets/pages/qrScan.dart';
import 'package:ma_money/widgets/widgets.dart';

class Accueil extends StatefulWidget {
  const Accueil({super.key});

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  @override
  Widget build(BuildContext context) {
    double longeur = MediaQuery.of(context).size.height;
    double largeur = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: largeur / 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: largeur / 9.5,
                      backgroundImage: AssetImage("assets/images/avatar.png"),
                    ),
                    SizedBox(width: largeur / 30.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Taïrou Baïssou",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "tbaissou@gmail.com",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "+229 65 92 40 88",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: longeur / 40.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: largeur / 2.2,
                      height: longeur / 10.0,
                      child: Card(
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/images/get_money.png",
                              color: Colors.green[700],
                              width: largeur / 5,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Créances",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: largeur / 25.0),
                                ),
                                SizedBox(height: longeur / 150.0),
                                const Text(
                                  "80 000 xof",
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: largeur / 2.2,
                      height: longeur / 10.0,
                      child: Card(
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/images/give_money.png",
                              color: Colors.red,
                              width: largeur / 5,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Dettes",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: largeur / 25.0),
                                ),
                                SizedBox(height: longeur / 150.0),
                                const Text(
                                  "27 000 xof",
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )),
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(largeur / 15.0),
                    topRight: Radius.circular(largeur / 15.0),
                  )),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            Widgets.alerte(context,
                                content: SizedBox(
                                  height: longeur / 3.5,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Card(
                                        color: Colors.green,
                                        child: SizedBox(
                                          width: largeur / 2.0,
                                          height: longeur / 10.0,
                                          child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: const [
                                                Icon(
                                                  Icons.edit_note,
                                                  color: Colors.white,
                                                ),
                                                Text(
                                                  "Scanner un qr code",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                )
                                              ]),
                                        ),
                                      ),
                                      Card(
                                        color: Colors.blue,
                                        child: SizedBox(
                                          width: largeur / 2.0,
                                          height: longeur / 10.0,
                                          child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: const [
                                                Icon(
                                                  Icons.qr_code,
                                                  color: Colors.white,
                                                ),
                                                Text(
                                                  "Scanner un qr code",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                )
                                              ]),
                                        ),
                                      ),
                                    ],
                                  ),
                                ));
                          },
                          child: Widgets.accueil_card(
                            context,
                            "assets/images/get_money.png",
                            "On me doit",
                            img_color: Colors.green,
                          ),
                        ),
                        Widgets.accueil_card(
                          context,
                          "assets/images/give_money.png",
                          "Je doit",
                          img_color: Colors.red,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Widgets.accueil_card(
                          context,
                          "assets/images/give_money_liste.png",
                          "Qui me doit ?",
                          imgSize: largeur / 3.5,
                          img_color: Colors.green,
                        ),
                        Widgets.accueil_card(
                          context,
                          "assets/images/get_money_list.png",
                          "A qui je doit ?",
                          imgSize: largeur / 2.5,
                          img_color: Colors.red,
                        ),
                      ],
                    )
                  ]),
            ),
          ),
        ],
      )),
    );
  }
}
