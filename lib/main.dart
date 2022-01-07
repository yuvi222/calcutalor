import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String output = '0';
  String _output = '0';
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = '';

  operation(String btntext) {
    if (btntext == 'C') {
      _output = '0';
      num1 = 0.0;
      num2 = 0.0;
      operand = '';
    } else if (btntext == '+' ||
        btntext == '-' ||
        btntext == 'x' ||
        btntext == '/') {
      num1 = double.parse(output);
      operand = btntext;
      _output = '0';
    } else if (btntext == '=') {
      num2 = double.parse(output);
      if (operand == '+') {
        _output = (num1 + num2).toString();
      }
      if (operand == '-') {
        _output = (num1 - num2).toString();
      }
      if (operand == 'x') {
        _output = (num1 * num2).toString();
      }
      if (operand == '/') {
        _output = (num1 / num2).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
      operand = '';
    } else {
      _output = _output + btntext;
    }
    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget button(String btntext) {
    return Expanded(
      child: RawMaterialButton(
        shape: Border.all(color: Colors.black, width: 2),
        fillColor: Colors.black12,
        padding: EdgeInsets.all(30.0),
        splashColor: Colors.black,
        child: Text(
          '$btntext',
          style: const TextStyle(
              fontSize: 30, color: Colors.white, fontWeight: FontWeight.w600),
        ),
        onPressed: () {
          operation(btntext);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Calculator'),
          backgroundColor: Colors.black12,
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.bottomRight,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    color: Colors.black12,
                  ),
                  margin: EdgeInsets.only(bottom: 8),
                  padding: EdgeInsets.all(20),
                  child: Text(
                    '$output',
                    style: TextStyle(fontSize: 60, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Row(
                children: [
                  button('9'),
                  const SizedBox(
                    width: 5,
                  ),
                  button('8'),
                  const SizedBox(
                    width: 5,
                  ),
                  button('7'),
                  const SizedBox(
                    width: 5,
                  ),
                  button('/'),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  button('4'),
                  const SizedBox(
                    width: 5,
                  ),
                  button('5'),
                  const SizedBox(
                    width: 5,
                  ),
                  button('6'),
                  const SizedBox(
                    width: 5,
                  ),
                  button('x'),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  button('3'),
                  const SizedBox(
                    width: 5,
                  ),
                  button('2'),
                  const SizedBox(
                    width: 5,
                  ),
                  button('1'),
                  const SizedBox(
                    width: 5,
                  ),
                  button('-'),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  button('0'),
                  const SizedBox(
                    width: 5,
                  ),
                  button('C'),
                  const SizedBox(
                    width: 5,
                  ),
                  button('='),
                  const SizedBox(
                    width: 5,
                  ),
                  button('+'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
