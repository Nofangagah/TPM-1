import 'package:flutter/material.dart';

class SumNumbersPage extends StatefulWidget {
  const SumNumbersPage({super.key});

  @override
  State<SumNumbersPage> createState() => _SumNumbersPageState();
}

class _SumNumbersPageState extends State<SumNumbersPage> {
  final TextEditingController _controller = TextEditingController();
  int _sum = 0;

  void _calculateSum() {
    List<int> numbers =
        _controller.text.split(',').map((e) => int.parse(e.trim())).toList();

    setState(() {
      _sum = numbers.reduce((a, b) => a + b);
    });
  }

  void logout() {
    Navigator.pop(context);
  }

  void clearRsult() {
    setState(() {
      _sum = 0;
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    final String username =
        ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Sum Numbers'),
        centerTitle: true,
        leading: Text("Hello, $username"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(onPressed: logout, icon: Icon(Icons.logout)),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter comma-separated numbers',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      backgroundColor: Colors.green,
                    ),
                    onPressed: _calculateSum,
                    child: const Text(
                      'Calculate',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(width: 16), // Memberi jarak antar tombol
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      backgroundColor: Colors.green,
                    ),
                    onPressed: clearRsult,
                    child: const Text(
                      'Reset',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Text(
              ' TotalSum: $_sum',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
