import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddPlacePage extends StatefulWidget {
  @override
  _AddPlacePageState createState() => _AddPlacePageState();
}

class _AddPlacePageState extends State<AddPlacePage> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _description = '';
  String _imageUrl = '';

  // Hàm gửi yêu cầu POST để thêm địa điểm mới
  Future<void> createPlace() async {
    final response = await http.post(
      Uri.parse('http://localhost:8080/api/places'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'name': _name,
        'description': _description,
        'imageUrl': _imageUrl,
      }),
    );

    if (response.statusCode == 200) {
      // Thành công
      Navigator.pop(context); // Quay lại màn hình chính
    } else {
      throw Exception('Failed to create place');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Place'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                onSaved: (value) {
                  _name = value!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Description'),
                onSaved: (value) {
                  _description = value!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Image URL'),
                onSaved: (value) {
                  _imageUrl = value!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an image URL';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    createPlace(); // Gọi hàm để gửi dữ liệu
                  }
                },
                child: Text('Add Place'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
