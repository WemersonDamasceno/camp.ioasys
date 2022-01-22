import '../widgets/list_todo_widget.dart';

import '../models/todo.dart';

import '../controllers/todo_controller.dart';

import '../../components/app_colors.dart';
import '../../components/appbar_widget.dart';
import 'package:flutter/material.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  late ControllerTodo _controllerTodo;

  @override
  void initState() {
    _controllerTodo = ControllerTodo();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppBarWidget(titulo: "Todo List"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  "Mar 22, 2022",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                  ),
                ),
              ),
              Text(
                "${_controllerTodo.listTodosIncompletas.length} incompletas, ${_controllerTodo.listTodosCompletas.length} completas",
              ),
              isEmptyLists()
                  ? duasListasVazias(size)
                  : atividadesIncompletas(size)
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: IMCCores.primary,
        onPressed: () {
          exibirModalBottom(size);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget atividadesIncompletas(size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 15),
          child: Text("Atividades incompletas"),
        ),
        _controllerTodo.listTodosIncompletas.isEmpty
            ? Align(
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/images/todolist/empty.gif",
                  width: size.width,
                  height: size.height * .28,
                ),
              )
            : SizedBox(
                height: size.height * .30,
                child: ListTodosWidget(
                  listCheck: false,
                  controller: _controllerTodo,
                  onDismiss: (direction, i) => setState(() {
                    var item = _controllerTodo.listTodosIncompletas[i];
                    _controllerTodo.removerTaskIncompleta(item);
                  }),
                  onPress: (value, index) => setState(
                    () {
                      ToDo item = _controllerTodo.listTodosIncompletas[index];
                      item.isCheck = !item.isCheck!;
                      _controllerTodo.removerTaskIncompleta(item);
                      _controllerTodo.addNovaTaskCompleta(item);
                    },
                  ),
                ),
              ),
        const Text("Atividades completas"),
        _controllerTodo.listTodosCompletas.isEmpty
            ? Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  "assets/images/todolist/empty.gif",
                  width: size.width,
                  height: size.height * .3,
                ),
              )
            : SizedBox(
                height: size.height * .30,
                child: ListTodosWidget(
                  onDismiss: (direction, i) => setState(() {
                    var item = _controllerTodo.listTodosCompletas[i];
                    _controllerTodo.removerTaskCompleta(item);
                  }),
                  listCheck: true,
                  controller: _controllerTodo,
                  onPress: (value, index) {},
                  cardColor: const Color(0xFF323232),
                  textStyle: const TextStyle(
                    decoration: TextDecoration.lineThrough,
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ),
      ],
    );
  }

  Widget duasListasVazias(size) {
    return Center(
      child: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              "assets/images/todolist/lista_vazia.gif",
              width: size.width * .8,
              height: size.height * .5,
            ),
          ),
          const Text("Adicione uma nova atividade!"),
        ],
      ),
    );
  }

  void exibirModalBottom(Size size) {
    showModalBottomSheet<void>(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        backgroundColor: Colors.white,
        context: context,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: SizedBox(
              height: size.height,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text('Adicione uma nova atividade!'),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: TextFormField(
                          controller: _controllerTodo.tituloTarefa,
                          decoration: const InputDecoration(
                              label: Text("Titulo"),
                              labelStyle: TextStyle(
                                color: IMCCores.primary,
                              )),
                        ),
                      ),
                      SizedBox(
                        width: size.width,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            setState(() {
                              ToDo todo = ToDo(
                                  titulo: _controllerTodo.tituloTarefa.text);
                              _controllerTodo.addNovaTaskIncompleta(todo);
                              Navigator.pop(context);
                            });
                          },
                          icon: const Icon(Icons.add_task_rounded),
                          label: const Text('Salvar atividade'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  isEmptyLists() {
    if (_controllerTodo.listTodosCompletas.isEmpty &&
        _controllerTodo.listTodosIncompletas.isEmpty) {
      return true;
    }
    return false;
  }
}
