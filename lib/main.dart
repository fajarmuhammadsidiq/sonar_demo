import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SonarQube Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String name = "";
  final TextEditingController _controller = TextEditingController();

  void _sayHello() {
    if (name.isEmpty) {
      // Ini bug potensial karena variabel name bisa kosong
      debugPrint("Nama kosong!");
    } else {
      debugPrint("Halo $name");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("SonarQube Example")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(labelText: "Masukkan nama"),
              onChanged: (val) => name = val,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _sayHello,
              child: const Text("Sapa"),
            ),
          ],
        ),
      ),
    );
  }
}
