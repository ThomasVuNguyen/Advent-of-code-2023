import 'package:advent_flutter/function.dart';
import 'package:flutter/material.dart';

import 'data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String hand = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(context: context, builder: (BuildContext context){
            return AlertDialog(
              content: Column(
                  children: [
                    TextField(
                      onChanged: (text){
                        hand = text;
                      },
                    ),
                  ],
                ),
              actions: [
                TextButton(
                onPressed: () {
                  print(Sorting2(hand));
                }, child: Text('Sort'),

              ),]

            );
          });
        },

      ),
      body: Center(
        child: Column(
          children: [
            Text('Lets play'),
            TextButton(
                onPressed: (){
                  List<String> HandList = DataConversion().keys.toList();
                  print(Round1(HandList).toString());
                }, child: Text('Go')),
          ],
        )
      ),
    );
  }
}
