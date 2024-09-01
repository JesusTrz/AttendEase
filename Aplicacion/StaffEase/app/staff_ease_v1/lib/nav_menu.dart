import 'package:flutter/material.dart';
import 'home_view.dart';
import 'attendance_view.dart';
import 'support_view.dart';
import 'documents_view.dart';

class NavMenu extends StatefulWidget {
  final String usuario;

  NavMenu({required this.usuario});

  @override
  _NavMenuState createState() => _NavMenuState();
}

class _NavMenuState extends State<NavMenu> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions(String usuario) => <Widget>[
        HomeView(),
        AttendanceView(usuario: usuario),
        SupportView(),
        DocumentView(),
      ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions(widget.usuario).elementAt(_selectedIndex),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 15,
              blurRadius: 30,
              offset: Offset(0, -2), // Sombra arriba del menú
            ),
          ],
        ),
        child: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 30),
              label: 'Inicio',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.qr_code_scanner, size: 30),
              label: 'Asistencia',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.support_agent, size: 30),
              label: 'Soporte',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.edit_document, size: 30),
              label: 'Documentos',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: const Color.fromARGB(255, 0, 0, 0),
          unselectedItemColor: Colors.grey,
          selectedFontSize: 14,
          unselectedFontSize: 12,
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          type: BottomNavigationBarType.fixed,
          onTap: _onItemTapped,
          showUnselectedLabels: false,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
