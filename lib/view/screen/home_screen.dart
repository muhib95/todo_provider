import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_provider/Model/todo_model.dart';
import 'package:todo_provider/Provider/todo_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

final _textController=TextEditingController();
  Future<void> _showDiologue() async{
    return showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text('Add todo list'),
        content: TextField(
          decoration: InputDecoration(
            hintText: 'write todo item'
          ),
          controller: _textController,


        ),
        actions: [
          TextButton(onPressed: () {
            Navigator.pop(context);
          }, child: Text('Cancel')),
          TextButton(onPressed: () {
            if(_textController.text.isEmpty){
              return;

            }
            context.read<TodoProvider>().addToDoList(TodoModel(title: _textController.text, isCompleted: false));
            _textController.clear();
            Navigator.pop(context);
          }, child: Text('Submit'))
        ],
      );
    },);
  }
  @override
  Widget build(BuildContext context) {

    final provider=Provider.of<TodoProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
            ),
            child: Center(
                child: Text('Todo List',
                    style: TextStyle(color: Colors.white, fontSize: 25))),
          )),
          Expanded(
            flex: 3,
            child: ListView.builder(
              itemCount: provider.allTodoList.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(provider.allTodoList[index].title),
              ),)
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showDiologue();
        },
        child: Icon(Icons.add,color: Colors.white,),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }
}
