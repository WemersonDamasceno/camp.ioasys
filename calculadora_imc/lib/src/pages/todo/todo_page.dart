import 'package:calculadora_imc/src/pages/todo/models/todo.dart';

import '../widgets/app_colors.dart';
import '../widgets/appbar_widget.dart';
import 'package:flutter/material.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  List<ToDo> listTodosCompletas = [];
  List<ToDo> listTodosIncompletas = [
    ToDo(titulo: "Beber agua", isCheck: false),
    ToDo(titulo: "Comer", isCheck: false),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppBarWidget(titulo: "Todo List"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                "Mar 21, 2022",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                ),
              ),
            ),
            isEmptyLists()
                ? duasListasVazias(size)
                : atividadesIncompletas(size)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: IMCCores.primary,
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget atividadesIncompletas(size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            "${listTodosIncompletas.length} incompletas, ${listTodosCompletas.length} completas"),
        const SizedBox(
          height: 10,
        ),
        const Text("Atividades incompletas"),
        listTodosIncompletas.isEmpty
            ? Align(
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/images/todolist/lista_vazia.gif",
                  width: size.width * .7,
                  height: size.height * .30,
                ),
              )
            : SizedBox(
                height: size.height * .30,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: listTodosIncompletas.length,
                    itemBuilder: (_, i) {
                      var item = listTodosIncompletas[i];
                      return Card(
                        child: CheckboxListTile(
                          value: item.isCheck,
                          onChanged: (value) {
                            setState(() {
                              item.isCheck = !item.isCheck;
                            });
                          },
                          title: Text(
                            item.titulo,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ),
                      );
                    }),
              ),
        const Text("Atividades completas"),
        listTodosCompletas.isEmpty
            ? Align(
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/images/todolist/lista_vazia.gif",
                  width: size.width * .7,
                  height: size.height * .30,
                ),
              )
            : const Text("Lista aqui")
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
              height: size.height * .4,
            ),
          ),
          const Text("Adicione uma nova atividade!"),
        ],
      ),
    );
  }

  isEmptyLists() {
    if (listTodosCompletas.isEmpty && listTodosIncompletas.isEmpty) {
      return true;
    }
    return false;
  }
}
