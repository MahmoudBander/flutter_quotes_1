// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_quotes_1/main.dart';

class CardWidgets extends StatelessWidget {
  final BestQuotes item;
  final Function delete;
  const CardWidgets({super.key, required this.delete, required this.item});
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
      margin: EdgeInsets.all(11),
      color: Color.fromRGBO(57, 66, 151, 1),
      child: Container(
        padding: EdgeInsets.all(11),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              textDirection: TextDirection.rtl,
              item.title,
              style: TextStyle(fontSize: 27, color: Colors.white),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    delete(item);
                  },
                  icon: Icon(Icons.delete),
                  color: Color.fromARGB(255, 255, 217, 217),
                  iconSize: 27,
                ),
                Text(
                  textDirection: TextDirection.rtl,
                  item.author,
                  style: TextStyle(fontSize: 27, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
