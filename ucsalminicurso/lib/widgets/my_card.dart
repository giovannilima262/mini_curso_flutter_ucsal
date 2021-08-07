import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  static getCard(BuildContext context) => Card(
        margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.08,
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SizedBox(
            height: 300,
            child: Column(
              children: [
                Expanded(
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Icon(
                      Icons.av_timer,
                      size: 200,
                    ),
                  ),
                ),
                Text("O que é Flutter"),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "In literary theory, a text is any object that can be read, whether this object is a work of literature, a street sign, an arrangement of buildings on a city block, or styles of clothing. It is a coherent set of signs that transmits some kind of informative message",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 500),
          child: getCard(context),
        ),
      ],
    );
  }
}
