import 'package:abp/screens/agenda.dart';
import 'package:abp/screens/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ABP',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'ABP'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  // Index de l'onglet sélectionné
  int _currentIndex = 0;

  // Listes des widgets correspondant à chaque onglet
  final List<Widget> _pages = [
    Agenda(),
    Center(child: Text('Page 2')),
    Home(),
    Center(child: Text('Page 4')),
    Center(child: Text('Page 5')),
  ];

  final List<String> app_bar_titre = [
    "Agenda",
    "Services",
    "Aujourd'hui",
    "Institut",
    "Paramètres"
  ];


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor : Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,//Theme.of(context).colorScheme.inversePrimary,
        title: Text(app_bar_titre[_currentIndex]),
          centerTitle : true,
        leading : Icon(Icons.menu),
        actions : [
          Icon(Icons.search),
          Icon(Icons.add),
          Icon(Icons.more_vert)
        ]
      ),
      body:  _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // Onglet sélectionné
        type: BottomNavigationBarType.fixed, // Permet de gérer plus de 3 onglets
        onTap: (int index) {
          setState(() {
            _currentIndex = index; // Mise à jour de l'index à chaque clic
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/images/agenda_icon.png')),
            label: 'Agenda',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/images/service_icon.png')),
            label: 'Services',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/images/today_icon.png')),
            label: "Aujourd'hui",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/images/institut_icon.png')),
            label: 'Institut',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/images/params_icon.png')),
            label: 'Paramètre',
          ),
        ],
        selectedItemColor: Colors.blue,  // Couleur des items sélectionnés
        unselectedItemColor: Colors.grey,  // Couleur des items non sélectionnés
      ),
    );
  }
}
