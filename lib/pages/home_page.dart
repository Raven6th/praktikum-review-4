import 'package:flutter/material.dart';
import 'package:pertemuan5/pages/settings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;
  void _onItemTap(int index) {
    setState(() {
      _index = index;
    });
  }

  static final List<Widget> _pages = [
    const Icon(
      Icons.home,
      size: 100,
    ),
    const Icon(
      Icons.chat_bubble,
      size: 100,
    ),
    const Icon(
      Icons.call,
      size: 100,
    ),
    const Icon(
      Icons.camera,
      size: 100,
    ),
  ];

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/profile.png'),
              ),
              accountName: Text("Praktikum Mobile"),
              accountEmail: Text('mobile@gmail.com'),
              decoration: BoxDecoration(color: Colors.lightBlueAccent),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pushNamed(context, '/Settings');
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Account'),
              onTap: () {
                Navigator.pushNamed(context, '/Accounts');
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/Accounts');
              },
              icon: const Icon(Icons.person)),
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/Settings');
              },
              icon: const Icon(Icons.settings))
        ],
      ),
      body: Center(
        child: _pages.elementAt(_index),
        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     ElevatedButton(
        //       child: const Text('Settings Screen'),
        //       onPressed: () {
        //         Navigator.pushNamed(context, '/Settings');
        //         // Navigator.push(
        //         //   context,
        //         //   MaterialPageRoute(
        //         //     builder: (context) {
        //         //       return const SettingsPage();
        //         //     },
        //         //   ),
        //         // );
        //       },
        //     ),
        //     const SizedBox(
        //       height: 20,
        //     ),
        //     ElevatedButton(
        //       child: const Text('Account Screen'),
        //       onPressed: () {
        //         Navigator.pushNamed(context, '/Accounts');
        //         // Navigator.push(
        //         //   context,
        //         //   MaterialPageRoute(
        //         //     builder: (context) {
        //         //       return const SettingsPage();
        //         //     },
        //         //   ),
        //         // );
        //       },
        //     ),
        //   ],
        // ),
      ),


      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blueAccent,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.black,
        currentIndex: _index,
        onTap: _onItemTap,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble),
            label: "Chat",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: "Telpon",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt_outlined),
            label: "Camera",
          ),
        ],
      ),
    );
  }
}
