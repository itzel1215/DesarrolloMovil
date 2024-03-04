// screens/destination_list_screen.dart
import 'package:flutter/material.dart';
import 'package:aplicacion1_flutter/screens/destination_detail_screen.dart';

class DestinationListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Destinos'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('París'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DestinationDetailScreen('París')),
              );
            },
          ),
          ListTile(
            title: Text('Tokio'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DestinationDetailScreen('Tokio')),
              );
            },
          ),
          // Agregar más destinos según sea necesario
        ],
      ),
    );
  }
}
