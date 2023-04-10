import 'dart:math';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _myController = TextEditingController();
  int _valoare = 0;

  @override
  void dispose() {
    _myController.dispose();
    super.dispose();
  }

  bool _isSquared(int valoare) {
    final int square = sqrt(valoare).toInt();
    if (square * square == valoare) {
      return true;
    }
    return false;
  }

  bool _isCubed(int valoare) {
    final int cubed = pow(valoare, 1 / 3.0).ceil();
    if (cubed * cubed * cubed == valoare) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(children: <Widget>[
            const Text('Please input a number to see if it is square or triangle.', style: TextStyle(fontSize: 20.0)),
            TextField(
              keyboardType: TextInputType.number,
              controller: _myController,
            ),
          ])),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _valoare = int.tryParse(_myController.value.text)!;
            if (_valoare > 0) {
              if (_isSquared(_valoare) && _isCubed(_valoare)) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Text('$_valoare is both SQUARE and TRIANGULAR'),
                    );
                  },
                );
              } else if (_isSquared(_valoare)) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Text('$_valoare is SQUARE'),
                    );
                  },
                );
              } else if (_isCubed(_valoare)) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Text('$_valoare is TRIANGULAR'),
                    );
                  },
                );
              } else {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Text('$_valoare is neither SQUARE or TRIANGULAR'),
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
