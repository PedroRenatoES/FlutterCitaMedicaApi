import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class VerCitasScreen extends StatefulWidget {
  final int pacienteId;

  VerCitasScreen({required this.pacienteId});

  @override
  _VerCitasScreenState createState() => _VerCitasScreenState();
}

class _VerCitasScreenState extends State<VerCitasScreen> {
  List<dynamic> citas = [];

  @override
  void initState() {
    super.initState();
    fetchCitas();
  }

  Future<void> fetchCitas() async {
  final response = await http.get(
    Uri.parse("https://e2c1-190-181-56-93.ngrok-free.app/api/Citas/ver/${widget.pacienteId}"),
  );
  if (response.statusCode == 200) {
    final responseData = json.decode(response.body);
    
    setState(() {
      // Si responseData es un mapa, intenta acceder a la lista de citas en la clave adecuada.
      if (responseData is Map<String, dynamic> && responseData.containsKey('citas')) {
        citas = responseData['citas'];
      } 
      // Si es una lista directamente, asígnala a `citas`.
      else if (responseData is List) {
        citas = responseData;
      }
    });
  } else {
    // Manejar el error de la API
    print("Error: ${response.statusCode}");
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Citas")),
      body: ListView.builder(
        itemCount: citas.length,
        itemBuilder: (context, index) {
          final cita = citas[index];
          return ListTile(
            title: Text(cita['motivo']),
            subtitle: Text("Fecha: ${cita['fechaHora']} - Estado: ${cita['estado']}"),
          );
        },
      ),
    );
  }
}
