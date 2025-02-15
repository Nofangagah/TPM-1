import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';


class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String input = "";
  String output = "0";
  

  void onButtonPressed(String value) {
    setState(() {
      if (value == "C") {
        output = "0";
        input = "";
      } else if (value == "=") {
        try {
          String result = evaluateExpression(input);
          output = result;
          input = result; 
        } catch (e) {
          output = "Error";
        }
      } else {
        if (output == "0" || output == "Error") {
          output = value;
          input = value;
        } else {
          output += value;
          input += value;
        }
      }
    });
  }

  String evaluateExpression(String expr) {
    try {
      Parser p = Parser();
      Expression exp = p.parse(expr);
      ContextModel cm = ContextModel();
      double result = exp.evaluate(EvaluationType.REAL, cm);
      return result % 1 == 0 ? result.toInt().toString() : result.toString();
    } catch (e) {
      return "Error";
    }
  }

  Widget _buildButton(String text) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () => onButtonPressed(text),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.all(24),
              child: Text(
                output,
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Column(
            children: [
              Row(children: [
                _buildButton("7"),
                _buildButton("8"),
                _buildButton("9"),
                _buildButton("/")
              ]),
              Row(children: [
                _buildButton("4"),
                _buildButton("5"),
                _buildButton("6"),
                _buildButton("*")
              ]),
              Row(children: [
                _buildButton("1"),
                _buildButton("2"),
                _buildButton("3"),
                _buildButton("-")
              ]),
              Row(children: [
                _buildButton("C"),
                _buildButton("0"),
                _buildButton("="),
                _buildButton("+")
              ]),
            ],
          )
        ],
        
      ),
    );
  }
}
