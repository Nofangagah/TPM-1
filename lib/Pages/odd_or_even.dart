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
      _controller.clear();
    });
  }

  void logout() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Odd or Even'),
        centerTitle: true,
        actions: [
          Padding(padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(onPressed: logout, child: Text("logout", style: TextStyle(fontSize: 11),)),
          )
        ],
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
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  onPressed: checkNumber,
                  child: Text("check", style: TextStyle(color: Colors.white)),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  onPressed: clearRsult, child: Text("Clear", style: TextStyle(color: Colors.white),)),
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
