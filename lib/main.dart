// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, non_constant_identifier_names, unnecessary_to_list_in_spreads

import 'package:flutter/material.dart';
import 'package:flutter_quotes_1/Widgets/card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: Quotes(),
    );
  }
}

class Quotes extends StatefulWidget {
  const Quotes({super.key});

  @override
  State<Quotes> createState() => _QuotesState();
}

// class for card_quotes(title,author)
class BestQuotes {
  String title;
  String author;
  BestQuotes({required this.title, required this.author});
}

class _QuotesState extends State<Quotes> {
  // list of all quotes .
  List allQuotes = [
    BestQuotes(author: "Ali Hassan", title: "رايق من نوعة فاخر 🔥"),
    BestQuotes(
        author: "Ali 7assan", title: "العقل السليم في البعد عن الحريم 😂"),
    BestQuotes(
        author: "Ali Elrayek",
        title: "كُتر التفكير فى الى ضااااع هيعمل لك فى دماغك صادااااع  😉 "),
    BestQuotes(
        author: "ELRAYEK",
        title: "فرح نفسك بنفسك ومتستناش حاجة حلوة من حد  ✋ "),
  ];

//  to delete card_quotes when cilcking on delete icon
  delete(BestQuotes item) {
    setState(() {
      allQuotes.remove(item);
    });
  }
// add new card_quote to the main sceen when cilcking  on "ADD" in showModalBottomsheet
  addQuotes() {
    setState(() {
      allQuotes.add(BestQuotes(
        author: myController2.text,
        title: myController.text,
      ));
    });
  }
  // create 2 controllers to get the text from the textfield
  final myController = TextEditingController();
  final myController2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: myController,
                        maxLength: 30,
                        decoration: InputDecoration(hintText: "Add new quotes"),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: myController2,
                        maxLength: 30,
                        decoration: InputDecoration(hintText: "Add author"),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextButton(
                          onPressed: () {
                            addQuotes();
                            Navigator.pop(context);
                          },
                          child: Text("ADD"))
                    ],
                  ),
                );
              },
              isScrollControlled: true);
        },
        backgroundColor: Colors.redAccent,
        child: Icon(
          Icons.add,
          color: Colors.white,  
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 50, 57, 121),
        title: Text(
          "Bast Quotes",
          style: TextStyle(fontSize: 27, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...allQuotes
                .map((item) => CardWidgets(
                      item: item,
                    // item: item.author,
                      delete:delete,
                    ))
                .toList()
          ],
        ),
      ),
    );
  }
}
