import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chip Flutter Widget')),
      body: Center(
        child: Wrap(
          spacing: 10,
          children: [
            _buildChip('Flutter', Colors.blue),
            _buildChip('Dart', Colors.lightBlueAccent),
            _buildChip('Google', Colors.red),
            _buildChip('Linux', Colors.orange),
            _buildChip('Java Script', Colors.yellow),
          ],
        ),
      ),
    );
  }

  Widget _buildChip(String label, Color color){
    return Chip(

      avatar: CircleAvatar(
        child: Text(label[0], style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
        backgroundColor: color,
      ),

      label: Text(label, style: TextStyle(color: Colors.grey.shade800, fontSize: 15)),
      backgroundColor: color.withOpacity(0.5),

      padding: const EdgeInsets.all(5.0),
      elevation: 2.0,


    );
  }

}
