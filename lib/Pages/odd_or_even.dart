import 'package:flutter/material.dart';

class OddOrEven extends StatefulWidget {
  const OddOrEven({super.key});

  @override
  State<OddOrEven> createState() => _OddOrEvenState();
}

class _OddOrEvenState extends State<OddOrEven> {
  final TextEditingController _controller = TextEditingController();
  String result = "";

  String isOddOrEven(int number) {
    return number % 2 == 0 ? "Genap" : "Ganjil";
  }

  void checkNumber() {
    setState(() {
      int? number = int.tryParse(_controller.text);
      if (number != null) {
        result = "Angka $number adalah ${isOddOrEven(number)}";
      } else {
        result = "enter a valid number!";
      }
    });
  }

  void clearRsult() {
    setState(() {
      result = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Odd or Even'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Masukkan angka:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 8),
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter a number',
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: checkNumber,
                  child: Text("check"),
                ),
                ElevatedButton(onPressed: clearRsult, child: Text("Clear")),
              ],
            ),
            
            SizedBox(height: 16),
            Text(
              result,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        
      ),
    );
  }
}
