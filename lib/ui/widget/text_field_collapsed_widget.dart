import 'package:flutter/material.dart';

class TextFieldCollapsedWidget extends StatelessWidget {
  const TextFieldCollapsedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          icon: Icon(
            Icons.add_box_outlined,
            color: Colors.blue,
          ),
          hintText: 'Type to add new task',
          border: InputBorder.none,
        ),
        enabled: false,
      ),
    );
  }
}
