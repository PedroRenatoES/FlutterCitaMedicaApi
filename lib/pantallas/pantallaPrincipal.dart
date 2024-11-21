import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  final int pacienteId;

  const MainScreen({Key? key, required this.pacienteId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bienvenido")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/verCitas', arguments: pacienteId),
            child: Text("Ver Citas"),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/agendarCita', arguments: pacienteId),
            child: Text("Agendar Cita"),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/historialMedico', arguments: pacienteId),
            child: Text("Ver Historial Médico"),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/verMedicos'),
            child: Text("Ver Médicos"),
          ),
        ],
      ),
    );
  }
}
