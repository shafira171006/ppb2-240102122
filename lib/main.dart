import 'package:flutter/material.dart';
import 'views/profile_page.dart';
import 'views/user_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Praktikum Widget & Dart Dasar',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MainNavigationPage(),
    );
  }
}

class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({super.key});

  @override
  MainNavigationPageState createState() => MainNavigationPageState();
}

class MainNavigationPageState extends State<MainNavigationPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    ProfilePage(),
    UserListPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: const Color(0xFF005F73),
        unselectedItemColor: Colors.grey,
        backgroundColor: const Color(0xFFA8D8FF), // Biru muda pastel (#A8D8FF)
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Daftar Mahasiswa',
          ),
        ],
      ),
    );
  }
}