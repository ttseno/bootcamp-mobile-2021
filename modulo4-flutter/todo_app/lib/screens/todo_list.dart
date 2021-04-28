import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/screens/todo_item.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List<Todo> list = [];

  @override
  void initState(){
    super.initState();
    _loadList();
  }


  _loadList() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    var data = preferences.getString("todo_list");
    if(data != null){
      setState(() {
        var objs = jsonDecode(data) as List;
        list = objs.map((obj) => Todo.fromJson(obj)).toList();
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.green, title: Text("To-do app"),),
      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(),
        itemCount: list.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("${list[index].title}"),
            subtitle: Text("${list[index].description}"),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TodoItem(todo: list[index],)
                )
            ).then((value) => _loadList()),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: Icon(Icons.add),
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => TodoItem())),
      ),
    );
  }
}
