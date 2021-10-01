import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hamtod_food/pages/login/login_page.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/homee';
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _subPageIndex = 0;
  var _selectedBottomNavIndex = 0;
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'HamTod Food',
          style: GoogleFonts.mali(),
        ),
        backgroundColor: Colors.pink.shade100,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/bg_01.jpg'), fit: BoxFit.cover),
        ),
        child: _buildSubPage(),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.pink.shade100,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.person,
                    size: 60.0,
                    color: Colors.white,
                  ),
                  Text(
                    'iiisamare',
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                ],
              ),
            ),
            ListTile(
              title: _buildDrawerItem(Icon(Icons.home), 'Home'),

              onTap: () => _showSubPage(0),
            ),
            ListTile(
              title: _buildDrawerItem(Icon(Icons.person), 'PAGE 1'),
              onTap: () => _showSubPage(1),
            ),
            ListTile(
              title: _buildDrawerItem(Icon(Icons.file_copy), 'PAGE 2'),
              onTap: () => _showSubPage(2),
            ),
            ListTile(
              title: _buildDrawerItem(Icon(Icons.settings), 'Settings'),
              onTap: () {},
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.pink.shade100,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],

      ),
    );
  }

  _showSubPage(int index) {
    setState(() {
      _subPageIndex = index;
    });
    Navigator.of(context).pop();
  }

  Widget _buildSubPage() {
    switch (_subPageIndex) {
      case 0: // home page
        return Center(
          child: Text(
            'THIS IS A HOME PAGE',
            style: GoogleFonts.mali(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: [
                Shadow(
                  blurRadius: 10.0,
                  color: Colors.blue,
                  offset: Offset(5.0, 5.0),
                ),
              ],
            ),
          ),
        );
      case 1:
        return Center(
          child: Text('PAGE 1'),
        );
      case 2:
        return Center(
          child: Text('PAGE 2'),
        );
      default:
        return SizedBox.shrink();
    }
  }
}

Row _buildDrawerItem(Widget icon, String title) {
  return Row(children: [
    icon,
    SizedBox(width: 8.0),
    Text(title),

  ]);
}
