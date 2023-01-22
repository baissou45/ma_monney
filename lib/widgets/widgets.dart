import 'package:flutter/material.dart';

class Widgets {
  static accueil_card(context, img, text, {imgSize, img_color}) {
    return Card(
      elevation: 7.5,
      child: Container(
        height: MediaQuery.of(context).size.height / 4.2,
        width: MediaQuery.of(context).size.width / 2.2,
        color: Colors.grey[50],
        child: Column(
          children: [
            Expanded(
                child: Center(
                    child: Image.asset(
              img,
              color: img_color,
              width: imgSize,
            ))),
            Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height / 50.0),
              child: Text(
                text,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width / 20.0),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static alerte(
    context, {
    Widget? content,
    String? titre,
  }) {
    return {
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                title: titre != null
                    ? Text(
                        titre,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width / 19.0,
                            fontWeight: FontWeight.bold),
                      )
                    : null,
                content: content,
              ))
    };
  }

  static fullNavigate(context, page) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => page),
        (Route<dynamic> route) => false);
  }

  static navigate(context, page) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return page;
    }));
  }
}
