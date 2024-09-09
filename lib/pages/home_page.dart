import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'add_place_page.dart'; // Import màn hình thêm địa điểm mới

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> _places = [];

  @override
  void initState() {
    super.initState();
    fetchPlaces();
  }

  Future<void> fetchPlaces() async {
    final response = await http.get(Uri.parse('http://localhost:8080/api/places'));

    if (response.statusCode == 200) {
      setState(() {
        _places = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load places');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular Destinations'),
      ),
      body: _places.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: _places.length,
        itemBuilder: (context, index) {
          final place = _places[index];
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Image.network(
                place['imageUrl'],
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(place['name']),
              subtitle: Text(place['description']),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddPlacePage()), // Điều hướng đến trang thêm địa điểm
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
