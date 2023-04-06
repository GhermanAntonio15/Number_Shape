import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Number Shape',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Number Shape Page'),
      debugShowCheckedModeBanner: false,
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
  final TextEditingController _myController = TextEditingController();
  int _valoare=0;

  @override
  void dispose() {
    _myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:
      Padding(padding: const EdgeInsets.all(15),
          child:Column(
        children: <Widget> [
          const Text("Please input a number to see if it is square or triangle.",
              style: TextStyle(
                fontSize: 20.0
              )
          ),
          TextField(
            keyboardType: const TextInputType.numberWithOptions(decimal: false),
            controller: _myController,
          ),])),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {

                _valoare=int.tryParse(_myController.value.text)!;
                if(_valoare>0){
                  int square=sqrt(_valoare).toInt();
                  int cubed=pow(_valoare,1.0/3.0).toInt();

                 if(square*square==_valoare && cubed*cubed*cubed==_valoare){
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text("$_valoare is both SQUARE and TRIANGULAR"),
                      );
                    },
                  );
                }
                 else if(square*square==_valoare){
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Text("$_valoare is SQUARE"),
                        );
                      },
                    );
                  } else if(cubed*cubed*cubed==_valoare){
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Text("$_valoare is TRIANGULAR"),
                        );
                      },
                    );
                  }  else{
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Text("$_valoare is neither SQUARE or TRIANGULAR"),
                        );
                      },
                    );
                  }
                }
              });

            },
            tooltip: 'Show me the value!',
            child: const Icon(Icons.verified),
          ),
    );
  }
}
