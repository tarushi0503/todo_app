import 'package:flutter/material.dart';
import '../model/todo.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todo;
  // ignore: prefer_typing_uninitialized_variables
  final onToDoChanged;
  // ignore: prefer_typing_uninitialized_variables
  final onDeleteItem;

  const ToDoItem(
      {Key? key,
      required this.todo,
      required this.onToDoChanged,
      required this.onDeleteItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: ListTile(
          onTap: () {
            onToDoChanged(todo);
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          tileColor: Colors.white70,
          leading: Icon(
            todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
            color: Colors.black,
          ),
          title: Text(
            todo.todoText!,
            style: TextStyle(
              fontSize: 16,
              color: const Color.fromARGB(255, 60, 30, 64),
              decoration: todo.isDone ? TextDecoration.lineThrough : null,
            ),
          ),
          trailing: Container(
            padding: const EdgeInsets.all(0),
            margin: const EdgeInsets.symmetric(vertical: 12),
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              //color: Colors.black87,
              borderRadius: BorderRadius.circular(13),
            ),
            child: IconButton(
              color: Colors.teal,
              iconSize: 18,
              icon: const Icon(Icons.delete),
              onPressed: () {
                onDeleteItem(todo.id);
              },
            ),
          ),
        ));
  }
}
