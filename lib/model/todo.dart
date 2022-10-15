class ToDo {
  String? id;
  String? todoText;
  late bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<ToDo> todoList() {
    return [
      ToDo(id:'01', todoText:'Brush',),
      ToDo(id:'02', todoText:'Morning exercise',),
      ToDo(id:'03', todoText:'Clean house', ),
      ToDo(id:'04', todoText:'Worship',),
      ToDo(id:'05', todoText:'Study',),
    ];
  }
}
