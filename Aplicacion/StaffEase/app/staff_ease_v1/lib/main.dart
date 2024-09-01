import 'package:flutter/material.dart';
import 'start_view.dart';
import 'login_view.dart';
import 'home_view.dart';
import 'attendance_view.dart';
import 'support_view.dart';
import 'documents_view.dart';
import 'nav_menu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StaffEase',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/start',
      routes: {
        '/start': (context) => StartLogin(),
        '/login': (context) => LoginPage(),
        '/nav': (context) => NavMenu(usuario: ''), // Ajusta esto más adelante
        '/home': (context) => HomeView(),
        '/support': (context) => SupportView(),
        '/document': (context) => DocumentView(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/attendance') {
          final String usuario = settings.arguments as String;
          return MaterialPageRoute(
            builder: (context) {
              return AttendanceView(usuario: usuario);
            },
          );
        }
        // Manejar otras rutas dinámicas aquí si es necesario
        return null;
      },
    );
  }
}
