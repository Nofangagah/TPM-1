import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    void logout() {
      Navigator.pop(context);
    }
    final String username = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Profile'),
        centerTitle: true,
        leading: Text("Hello, $username"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(onPressed: logout, icon: Icon(Icons.logout)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ProfileCard(
                name: "Nofan Zohrial",
                nim: "123220023",
                imagePath: "assets/images/1105633.jpg",
              ),
              ProfileCard(
                name: "Farid Radityo Suharman",
                nim: "123220094",
                imagePath: "assets/images/1729260477113.jpg",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  final String name;
  final String nim;
  final String imagePath;

  const ProfileCard({
    super.key,
    required this.name,
    required this.nim,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipOval(
              clipBehavior: Clip.antiAlias,
              child: Image.asset(
                imagePath,
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 4),
                  Text(name,
                      style:
                          const TextStyle(color: Colors.black, fontSize: 20)),
                  const SizedBox(height: 4),
                  Text(nim,
                      style:
                          const TextStyle(color: Colors.black, fontSize: 20)),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
