import 'package:flutter/material.dart';

class SupportView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comunicación y Soporte'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        elevation: 5,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 255, 255, 255)!,
              const Color.fromARGB(255, 212, 212, 212)!
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildSupportButton(
                context,
                'Fallo Técnico',
                _technicalFailureGuide,
                Colors.blueGrey,
                Icons.build,
              ),
              SizedBox(height: 16.0),
              _buildSupportButton(
                context,
                'Accidente',
                _accidentProcedure,
                Colors.redAccent,
                Icons.warning,
              ),
              SizedBox(height: 16.0),
              _buildSupportButton(
                context,
                'Emergencia',
                _emergencyProcedure,
                Colors.orangeAccent,
                Icons.local_hospital,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSupportButton(
    BuildContext context,
    String title,
    String guide,
    Color color,
    IconData icon,
  ) {
    return ElevatedButton.icon(
      onPressed: () => showSupportDialog(context, title, guide),
      icon: Icon(icon, size: 28),
      label: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        backgroundColor: color, // Cambiado de primary a backgroundColor
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 6,
        shadowColor: Colors.black45,
      ),
    );
  }

  void showSupportDialog(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          content: Text(content, style: TextStyle(fontSize: 16)),
          backgroundColor: Colors.grey[800],
          titleTextStyle: TextStyle(color: Colors.white),
          contentTextStyle: TextStyle(color: Colors.white70),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cerrar', style: TextStyle(color: Colors.blueGrey)),
            ),
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        );
      },
    );
  }

  String get _technicalFailureGuide => '''
1. Verifica las conexiones de hardware (cables, puertos, etc.).
2. Reinicia el sistema o el dispositivo afectado.
3. Consulta el manual de usuario para posibles soluciones.
4. Contacta al equipo de soporte técnico si el problema persiste.
''';

  String get _accidentProcedure => '''
1. Detén cualquier actividad en curso y asegúrate de que todos los involucrados estén seguros.
2. Llama a los servicios de emergencia si es necesario.
3. Proporciona primeros auxilios básicos si estás capacitado.
4. Informa del accidente a un supervisor o al departamento de recursos humanos.
5. Completa un informe de accidente lo antes posible.
''';

  String get _emergencyProcedure => '''
1. Evalúa la situación y determina la gravedad de la emergencia.
2. Evacúa el área siguiendo las rutas de evacuación establecidas.
3. Llama a los servicios de emergencia y proporciona detalles específicos.
4. Sigue las instrucciones del personal de emergencia y mantén la calma.
5. Reúnete en el punto de encuentro designado para recibir instrucciones adicionales.
''';
}

void main() => runApp(MaterialApp(
      home: SupportView(),
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        scaffoldBackgroundColor: Colors.grey[850],
      ),
    ));
