import 'dart:convert';
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/models/todo.dart';

class TodoItem extends StatefulWidget {
  final Todo todo;
  TodoItem({Key key, this.todo}) : super(key: key);

  @override
  _TodoItemState createState() => _TodoItemState(todo);
}

class _TodoItemState extends State<TodoItem> {
  Todo _todo;

  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

    _TodoItemState(Todo todo) {
      _todo = todo;
      if(todo != null){
        _titleController.text = _todo.title;
        _descriptionController.text = _todo.description;
      }
    }


  _saveItem() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var data = preferences.getString("todo_list");

    List<Todo> todoList = [];

    if(data != null){
      var objs = jsonDecode(data) as List;
      todoList = objs.map((obj) => Todo.fromJson(obj)).toList();
    }
    Todo newTodo;

    if(_todo != null ){
      newTodo = todoList.firstWhere((element) => element.id == _todo.id);
      newTodo.title = _titleController.text;
      newTodo.description = _descriptionController.text;
    } else {
      var uuid = Uuid();
      newTodo = Todo(uuid.v1(), _titleController.text, _descriptionController.text);
      todoList.add(newTodo);
    }

    preferences.setString("todo_list", jsonEncode(todoList));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("To-do Item"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _titleController,
              decoration: InputDecoration(
                  hintText: "Title",
                  border: OutlineInputBorder()
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                  hintText: "Description",
                  border: OutlineInputBorder()
              ),
            ),
          ),
          ElevatedButton(
            child: Text("Save", style: TextStyle(fontSize: 15),),
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green)),
            onPressed: _saveItem,
          )
        ],
      )
    );
  }
}
