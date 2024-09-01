import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Imagen de fondo
          Positioned.fill(
            child: Image.asset(
              'assets/img_background/inicio_img.jpg', // Reemplaza con la ruta de tu imagen de fondo
              fit: BoxFit.cover,
            ),
          ),
          // Contenido encima de la imagen
          Padding(
            padding: EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(
                          0.9), // Fondo semi-transparente para la legibilidad
                      borderRadius: BorderRadius.circular(16.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 12,
                          offset: Offset(0, 6), // Sombra hacia abajo
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '¡Hola!',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800],
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Soy tu aplicación StaffEase.',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[700],
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          'Estoy aquí para ayudarte y apoyarte en tus tareas diarias. Si estás usando esta app, es porque ya eres parte de nuestra empresa.',
                          style:
                              TextStyle(fontSize: 16, color: Colors.grey[600]),
                        ),
                        SizedBox(height: 12),
                        Text(
                          'Espero que te sea de gran ayuda y que estés con nosotros el mayor tiempo posible. ¡Gracias por ser parte de StaffEase!',
                          style:
                              TextStyle(fontSize: 16, color: Colors.grey[600]),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Atentamente, StaffEase :)',
                          style: TextStyle(
                              fontSize: 16,
                              fontStyle: FontStyle.italic,
                              color: Colors.grey[700]),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 32),
                  Text(
                    '¿Qué es lo que puedes hacer?',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  SizedBox(height: 20),
                  _buildSection(
                    'Asistencia',
                    [
                      'Registra tu asistencia diaria en la empresa.',
                      'Consulta el historial de tus registros de entrada y salida.',
                    ],
                  ),
                  SizedBox(height: 20),
                  _buildSection(
                    'Comunicación y Soporte',
                    [
                      'Consulta las Preguntas Frecuentes para resolver dudas.',
                      'Revisa las Políticas y Procedimientos de la empresa.',
                      'Utiliza el ChatBot para comunicarte con diferentes departamentos en caso de problemas.',
                    ],
                  ),
                  SizedBox(height: 20),
                  _buildSection(
                    'Documentación y Recursos',
                    [
                      'Accede a la documentación esencial de la empresa.',
                      'Utiliza herramientas adicionales disponibles.',
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, List<String> items) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[200]
            ?.withOpacity(0.9), // Fondo semi-transparente para los contenedores
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 1,
            blurRadius: 6,
            offset: Offset(0, 2), // Sombra hacia abajo
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          SizedBox(height: 10),
          ...items.map((item) => Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  '• $item',
                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                ),
              )),
        ],
      ),
    );
  }
}
