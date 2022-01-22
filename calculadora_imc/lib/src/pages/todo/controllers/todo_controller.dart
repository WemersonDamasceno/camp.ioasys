import 'package:flutter/cupertino.dart';

import '../models/todo.dart';

class ControllerTodo {
  //ListTodos listTodosData = ListTodos();
  List<ToDo> listTodosCompletas = [];
  List<ToDo> listTodosIncompletas = [];

  TextEditingController tituloTarefa = TextEditingController();
  bool isCheck = false;

  addNovaTaskIncompleta(ToDo todo) {
    listTodosIncompletas.add(todo);
    tituloTarefa.text = "";
  }

  addNovaTaskCompleta(ToDo todo) {
    listTodosIncompletas.remove(todo);
    listTodosCompletas.add(todo);
    tituloTarefa.text = "";
  }

  removerTaskIncompleta(ToDo todo) {
    listTodosIncompletas.remove(todo);
  }

  removerTaskCompleta(ToDo todo) {
    listTodosCompletas.remove(todo);
  }
}
