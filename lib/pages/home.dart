import "package:flutter/material.dart";
import "package:todo_app/pages/home.dart";
import "package:todo_app/utilities/dialogBox.dart";
import "package:todo_app/utilities/todo_tile.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //List of ToDO

  List todoList = [
    ["Read", false],
    ["1.5KM Runs", false],
  ];

  //text coontroller
  final _controller = TextEditingController();

  //Checkbox changed
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
  }

  //Save Task
  void saveTask() {
    setState(() {
      todoList.add([_controller.text, false]);
      _controller.clear();
    });

    Navigator.of(context).pop();
  }

  //Create new task
  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: saveTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal[50],
        appBar: AppBar(
          title: Text("To Do"),
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          child: Icon(Icons.add),
        ),
        body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            return ToDoTile(
              taskName: todoList[index][0],
              isChecked: todoList[index][1],
              onChanged: (value) => checkBoxChanged(value, index),
            );
          },
        ));
  }
}
