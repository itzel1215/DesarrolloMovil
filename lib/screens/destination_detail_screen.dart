// screens/destination_detail_screen.dart
import 'package:flutter/material.dart';

class DestinationDetailScreen extends StatefulWidget {
  final String destination;

  DestinationDetailScreen(this.destination);

  @override
  _DestinationDetailScreenState createState() =>
      _DestinationDetailScreenState();
}

class _DestinationDetailScreenState extends State<DestinationDetailScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.destination),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/${widget.destination.toLowerCase()}_image.jpg',
                height: 200),
            SizedBox(height: 20),
            Text('Bienvenido a ${widget.destination}'),
            SizedBox(height: 20),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Nombre'),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Correo Electrónico'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Aquí puedes manejar la lógica para guardar los datos en una base de datos
                // Por ahora, solo mostramos un mensaje
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Registro exitoso'),
                    content: Text(
                        '¡Bienvenido a ${widget.destination}, ${_nameController.text}!'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('OK'),
                      ),
                    ],
                  ),
                );
              },
              child: Text('Registrar'),
            ),
          ],
        ),
      ),
    );
  }
}
