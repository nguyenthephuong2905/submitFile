import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular Destinations'),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Nội dung khác của trang sẽ được chồng lên trên ảnh nền
          ListView(
            children: [
              // Ví dụ danh sách các điểm đến
              Container(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Popular Destination 1',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
              Container(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Popular Destination 2',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
              // Thêm nhiều nội dung khác
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddPlacePage()),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}

class AddPlacePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Place'),
      ),
      body: Center(
        child: Text('Add Place Page'),
      ),
    );
  }
}
