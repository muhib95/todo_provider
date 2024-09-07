import 'package:flutter/widgets.dart';
import 'package:todo_provider/Model/todo_model.dart';

class TodoProvider extends ChangeNotifier {
final List<TodoModel> _todoList=[];

List<TodoModel>get allTodoList=>_todoList;
void addToDoList(TodoModel todoModel){
  _todoList.add(todoModel);
  notifyListeners();

}
void removeTodo(TodoModel todoModel){
  final index=_todoList.indexOf(todoModel);
  _todoList.removeAt(index);
  notifyListeners();

}

void toggle(TodoModel toDOModel){
  final index=_todoList.indexOf(toDOModel);
  _todoList[index].toggleCompleted();
  notifyListeners();


}
}