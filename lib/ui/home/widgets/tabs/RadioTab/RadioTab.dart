import 'package:flutter/material.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return //Container(color: Colors.green,);
    Center(
      child: Stack(
        alignment: Alignment.center,
        fit: StackFit.loose,
        clipBehavior: Clip.none,
        children: [
           Positioned(top: -20, child: Icon(Icons.star, size: 40, color: Colors.yellow)),
      Container(width: 200, height: 200, color: Colors.blue),
      Text("أنا في النص", style: TextStyle(color: Colors.white)),
     
        ],
      ),
    );
  }
}
