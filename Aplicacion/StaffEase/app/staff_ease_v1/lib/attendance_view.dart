import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class AttendanceView extends StatefulWidget {
  final String usuario;

  AttendanceView({required this.usuario});

  @override
  _AttendanceViewState createState() => _AttendanceViewState();
}

class _AttendanceViewState extends State<AttendanceView> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  bool scanned = false;
  List<dynamic> history = [];

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      if (!scanned) {
        setState(() {
          scanned = true;
        });
        _handleQRCode(scanData.code);
      }
    });
  }

  void _handleQRCode(String? qrCode) {
    if (qrCode != null && qrCode == widget.usuario) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registro exitoso')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('QR inválido')),
      );
    }
    setState(() {
      scanned = false;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de Asistencia'),
      ),
      body: Container(
        color: Color.fromARGB(255, 20, 20, 20), // Fondo de la pantalla
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 5,
              child: Center(
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: Offset(0, 4), // Cambia la posición de la sombra
                      ),
                    ],
                  ),
                  child: QRView(
                    key: qrKey,
                    onQRViewCreated: _onQRViewCreated,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    controller?.resumeCamera();
                  },
                  child: Text('Escanear QR'),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: ListView.builder(
                itemCount: history.length,
                itemBuilder: (context, index) {
                  final item = history[index];
                  return ListTile(
                    title: Text('Entrada: ${item['HoraEntrada']}'),
                    subtitle: item['HoraSalida'] != null
                        ? Text('Salida: ${item['HoraSalida']}')
                        : Text('Salida: No registrada'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
