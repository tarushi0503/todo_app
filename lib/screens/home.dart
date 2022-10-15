import 'package:flutter/material.dart';
import 'package:todo_app/widgets/todo_item.dart';
import '../model/todo.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todosList = ToDo.todoList();
  List<ToDo> _foundToDo = [];
  final _todoController = TextEditingController();

  @override
  void initState() {
    _foundToDo = todosList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 92, 207, 186),
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              children: [
                searchBox(),

                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 50, bottom: 20),
                        child: Text(
                          "To Dos",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      for (ToDo t in _foundToDo)
                        ToDoItem(
                          todo: t,
                          onToDoChanged: _handleToDoChange,
                          
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
          
          Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(
                        bottom: 20,
                        right: 20,
                        left: 20,
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        controller: _todoController,
                        decoration: InputDecoration(
                            hintText: 'Add a new item',
                            border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      bottom: 20,
                      right: 20,
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        
                      },
                      child: Text(
                        '+',
                        style: TextStyle(fontSize: 40,
                        color: Colors.black),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.tealAccent,
                          minimumSize: Size(50, 50),
                          elevation: 10),
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.teal,
      title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Icon(Icons.menu, color: Colors.white, size: 30),
        SizedBox(
            height: 40,
            width: 40,
            child:
                CircleAvatar(backgroundImage: AssetImage('assets/task.png')))
      ]),
    );
  }

  Widget searchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.white24,
          borderRadius: BorderRadius.circular(20)),
      child: TextField(
        onChanged: ((value) => _find(value)),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 20,
            minWidth: 25,
          ),
          border: InputBorder.none,
          hintText: "Search",
          hintStyle: TextStyle(color: Colors.black54),
        ),
      ),
    );
  }

  void _handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  // void _deleteTodoItem(String id) {
  //   setState(() {
  //     todosList.removeWhere((item) => item.id == id);
  //   });
  // }

 

  void _find(String searchWord) {
    List<ToDo> results = [];
    if (searchWord.isEmpty) {
      results = todosList;
    } else {
      results = todosList
          .where((item) =>
              item.todoText!.toLowerCase().contains(searchWord.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundToDo=results;
    });
  }
}
