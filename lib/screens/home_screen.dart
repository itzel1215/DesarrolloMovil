// screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:aplicacion1_flutter/screens/destination_list_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Viaja por el mundo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/world_map.jpg', height: 200),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DestinationListScreen()),
                );
              },
              child: Text('Explorar Destinos'),
            ),
          ],
        ),
      ),
    );
  }
}
