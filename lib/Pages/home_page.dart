import 'package:flutter/material.dart';
import 'package:tugas_kelompok_p1/Pages/calculator_page.dart';
import 'package:tugas_kelompok_p1/Pages/odd_or_even.dart';
import 'package:tugas_kelompok_p1/Pages/profile_page.dart';
import 'package:tugas_kelompok_p1/Pages/sum_numbers_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  final List<Widget> pages = [
    CalculatorPage(),
    OddOrEven(),
    ProfilePage(),
    SumNumbersPage()
  ];


  void onTapNavigationItem(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        onTap: onTapNavigationItem,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Calculator',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.numbers),
            label: 'Odd or Even',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.numbers),
            label: 'Sum Numbers',
          ),  
        ],
      ),
    );
  }
}