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
    return number % 2 == 0 ? "Even" : "Odd";
  }

  void checkNumber() {
    setState(() {
      int? number = int.tryParse(_controller.text);
      if (number != null) {
        result = "Number $number is ${isOddOrEven(number)}";
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
    final String username = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Odd or Even'),
        centerTitle: true,
        leading: Text("Hello, $username"),
        actions: [
          Padding(padding: const EdgeInsets.all(8.0),
          child: IconButton(onPressed: logout, icon: Icon(Icons.logout)),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Input a Number:',
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
