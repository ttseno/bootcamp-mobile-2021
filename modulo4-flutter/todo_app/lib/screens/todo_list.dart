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

  _removeItem(String id) {
    debugPrint(list.toString());
    setState(() {
      list.removeWhere((element) => element.id == id);
    });

    SharedPreferences
        .getInstance()
        .then((preferences) => preferences.setString("todo_list", jsonEncode(list)));
  }

  _doneItem(String id){
    setState(() {
      list.firstWhere((element) => element.id == id).done = true;
    });
    SharedPreferences
        .getInstance()
        .then((preferences) => preferences.setString("todo_list", jsonEncode(list)));
  }

  _showAlertDialog(BuildContext context, String alertContent, Function action, String id){
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text("Action confirmation"),
            content: Text(alertContent),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Cancel', style: TextStyle(color: Colors.red) ,)),
              TextButton(
                  onPressed: () {
                    action(id);
                    Navigator.pop(context);
                  },
                  child: Text('Continue'))
            ],
          );
        });
  }

  var _doneStyle = TextStyle(color: Colors.green, decoration: TextDecoration.lineThrough);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.green, title: Text("To-do app"),),
      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(),
        itemCount: list.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("${list[index].title}",
                        style: list[index].done ? _doneStyle : null ,
            ),
            subtitle: Text("${list[index].description}",
                style: list[index].done ? _doneStyle : null ,
            ),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TodoItem(todo: list[index],)
                )
            ).then((value) => _loadList()),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () => _showAlertDialog(context, "Do you really want to remove item?", _removeItem, list[index].id)
                ),
                Visibility(
                    visible: !list[index].done,
                    child: IconButton(
                        icon: Icon(Icons.check),
                        onPressed:
                            () => _showAlertDialog(context, "Do you want to mark item as done?", _doneItem, list[index].id))
                )

              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: Icon(Icons.add),
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TodoItem())
        ).then((value) => _loadList()),
      ),
    );
  }
}
