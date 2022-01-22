import 'todo.dart';

class ListTodos {
  List<ToDo> listTodosCompletos;
  List<ToDo> listTodosIncompletos;
  String data;

  ListTodos({
    required this.listTodosIncompletos,
    required this.listTodosCompletos,
    required this.data,
  });
}
