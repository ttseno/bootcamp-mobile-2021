class Todo {
  String id;
  String title;
  String description;
  bool done;

  Todo.empty();
  Todo(String id, String title, String description){
    this.id = id;
    this.title = title;
    this.description = description;
    this.done = false;
  }

  Todo.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        description = json['description'],
        done = json['done'];

  Map toJson () => {
    'id': id,
    'title': title,
    'description': description,
    'done': done
  };

}