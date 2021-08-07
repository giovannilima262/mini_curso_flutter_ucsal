import 'dart:io';
import 'dart:math';

import 'package:draw_graph/models/feature.dart';
import 'package:flutter/material.dart';
import 'package:ucsalminicurso/page/screen_blue.dart';
import 'package:ucsalminicurso/widgets/my_card.dart';
import 'package:draw_graph/draw_graph.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/screenBlue': (context) => const ScreenBlue(),
      },
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class User {
  User({
    @required this.name,
    this.isFavorite = false,
  });

  String name;
  bool isFavorite;
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<User> users;

  @override
  void initState() {
    super.initState();
    users = [];
  }

  void addName() {
    users.add(
      User(name: generateRandomString(Random().nextInt(10))),
    );
    setState(() {});
  }

  String generateRandomString(int len) {
    var r = Random();
    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    return List.generate(len, (index) => _chars[r.nextInt(_chars.length)])
            .join() +
        '-';
  }

  final List<Feature> features = [
    Feature(
      title: "Drink Water",
      color: Colors.blue,
      data: [0.2, 0.8, 0.4, 0.7, 0.6],
    ),
    Feature(
      title: "Exercise",
      color: Colors.pink,
      data: [1, 0.8, 0.6, 0.7, 0.3],
    ),
    Feature(
      title: "Study",
      color: Colors.cyan,
      data: [0.5, 0.4, 0.85, 0.4, 0.7],
    ),
    Feature(
      title: "Water Plants",
      color: Colors.green,
      data: [0.6, 0.2, 0, 0.1, 1],
    ),
    Feature(
      title: "Grocery Shopping",
      color: Colors.amber,
      data: [0.25, 1, 0.3, 0.8, 0.6],
    ),
  ];

  Widget listUsers() => SizedBox(
        height: 200,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: users?.length,
          itemBuilder: (context, i) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(users[i].name),
                    IconButton(
                      icon: Icon(
                        users[i].isFavorite
                            ? Icons.favorite
                            : Icons.favorite_outline,
                        color: users[i].isFavorite ? Colors.red : null,
                      ),
                      onPressed: () {
                        users[i].isFavorite = !users[i].isFavorite;
                        setState(() {});
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: [
          listUsers(),
          MyCard(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.036,
          ),
          MyCard.getCard(context),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.036,
          ),
          Wrap(
            spacing: 8.0,
            runSpacing: 4.0,
            children: [
              Chip(
                backgroundColor: Colors.blue,
                label: const Text('Hamilton'),
              ),
              Chip(
                backgroundColor: Colors.blue,
                label: const Text('Hamilton'),
              ),
              Chip(
                backgroundColor: Colors.blue,
                label: const Text('Hamilton'),
              ),
              Chip(
                backgroundColor: Colors.blue,
                label: const Text('Hamilton'),
              ),
              Chip(
                backgroundColor: Colors.blue,
                label: const Text('Hamilton'),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.036,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/screenBlue');
              /*Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => ScreenBlue()),
              );*/
            },
            child: Text("Botão"),
          ),
          Center(
            child: LineGraph(
              features: features,
              size: Size(320, 400),
              labelX: ['Day 1', 'Day 2', 'Day 3', 'Day 4', 'Day 5'],
              labelY: ['20%', '40%', '60%', '80%', '100%'],
              showDescription: true,
              graphColor: Colors.white30,
              graphOpacity: 0.2,
              verticalFeatureDirection: true,
              descriptionHeight: 130,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addName,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
