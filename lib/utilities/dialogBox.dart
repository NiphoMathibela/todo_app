// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:todo_app/utilities/button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  //Controller constructor

  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  //Save


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.teal[300],
      content: Container(
          height: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: controller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "Add a new task"),
              ),

              //Buttons
              Row(
                children: [
                  MyButton(text: "Save", onPressed: onSave),
                  const SizedBox(
                    width: 10,
                  ),
                  MyButton(text: "Cancel", onPressed: onCancel)
                ],
              )
            ],
          )),
    );
  }
}
