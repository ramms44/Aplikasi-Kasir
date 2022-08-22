import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Aplikasi Karyawan';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.grey,
      fontStyle: FontStyle.italic);

  static ButtonStyle style =
      ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 16));
  // ignore: prefer_final_fields
  List<Widget> _widgetOptions = <Widget>[
    Text(
      'Home',
      style: optionStyle,
    ),
    Center(
      child: Text(
        'Absensi Karyawan',
        style: optionStyle,
      ),
    ),
    Text(
      'POS (Point Of Sale)',
      style: optionStyle,
    ),
    Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Data / Nota',
              style: optionStyle,
            ),
            Container(
              width: 250,
              child: Divider(
                color: Colors.grey,
              ),
            ),
            Text(
              'Barang / Produk',
              style: optionStyle,
            ),
          ],
        ),
      ),
    ),
    Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Profile Karyawan',
              style: optionStyle,
            ),
            Container(
              width: 250,
              child: Divider(
                color: Colors.grey,
              ),
            ),
            ElevatedButton(
              style: style,
              onPressed: () {
                _signOut();
              },
              child: const Text('Sign Out'),
            ),
          ],
        ),
      ),
    )
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aplikasi Karyawan'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.co_present),
            label: 'Absensi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.post_add),
            label: 'POS',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.file_copy_rounded),
            label: 'Data',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 53, 53, 53),
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }

  static _signOut() {}
}
