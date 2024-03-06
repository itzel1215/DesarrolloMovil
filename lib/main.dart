import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scrum App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ScrumListView(),
    );
  }
}

class ScrumListView extends StatefulWidget {
  @override
  _ScrumListViewState createState() => _ScrumListViewState();
}

class _ScrumListViewState extends State<ScrumListView> {
  List<Map<String, dynamic>> scrumData = [];

  @override
  void initState() {
    super.initState();
    loadScrumData();
  }

  void loadScrumData() async {
    String jsonString = await rootBundle.loadString('assets/data_scrum.json');
    List<dynamic> jsonData = json.decode(jsonString);
    List<Map<String, dynamic>> loadedData =
        List<Map<String, dynamic>>.from(jsonData);
    setState(() {
      scrumData =
          loadedData.take(10).toList(); // Tomar solo los primeros 10 elementos
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Elementos Scrum'),
      ),
      body: ListView.builder(
        itemCount: scrumData.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(scrumData[index]['name']),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ScrumDetailScreen(scrum: scrumData[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ScrumDetailScreen extends StatelessWidget {
  final Map<String, dynamic> scrum;

  ScrumDetailScreen({required this.scrum});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(scrum['name']),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Descripción: ${scrum['description']}'),
            SizedBox(height: 10),
            // Puedes agregar más detalles si es necesario
            Text('Ejemplo: ${scrum['example']}'),
          ],
        ),
      ),
    );
  }
}
