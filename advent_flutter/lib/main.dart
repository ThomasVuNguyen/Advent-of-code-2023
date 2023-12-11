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
  String hand1 = ''; String hand2 = ''; String hand3 ='';
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
                        hand1 = text;
                      },
                    ),
                    TextField(
                      onChanged: (text){
                        hand2 = text;
                      },
                    ),
                    TextField(
                      onChanged: (text){
                        hand3 = text;
                      },
                    ),
                  ],
                ),
              actions: [
                TextButton(
                onPressed: () {

                  print(hand1 + hand2 + hand3);
                  print(Round2([hand1, hand2, hand3]));
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
                  print('data conversion: ${DataConversion().toString()}');
                  print(EntireProcessTest().toString());
                  print('Total: ${EntireProcess()}');
                }, child: Text('Go')),
          ],
        )
      ),
    );
  }
}
