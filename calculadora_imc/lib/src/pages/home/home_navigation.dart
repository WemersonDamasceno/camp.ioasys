import 'pages/home_page.dart';
import '../todo/pages/todo_page.dart';
import '../components/app_colors.dart';
import 'package:flutter/material.dart';

class HomeNavigationWidget extends StatefulWidget {
  const HomeNavigationWidget({Key? key}) : super(key: key);

  @override
  _HomeNavigationWidgetState createState() => _HomeNavigationWidgetState();
}

class _HomeNavigationWidgetState extends State<HomeNavigationWidget> {
  int paginaSelecionada = 0;

  static const List<Widget> listaPaginas = <Widget>[
    HomePage(),
    TodoPage(),
  ];

  void itemSelecionado(int index) {
    setState(() {
      paginaSelecionada = index;
    });
  }

  getTituloAppBar() {
    switch (paginaSelecionada) {
      case 0:
        return "Calculadora IMC";
      case 1:
        return "Todo List";
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: listaPaginas.elementAt(paginaSelecionada),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey.shade200,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate_rounded),
            label: "IMC",
            backgroundColor: IMCCores.primary,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.task_alt_rounded,
            ),
            label: "Todo List",
            backgroundColor: Colors.purple,
          ),
        ],
        currentIndex: paginaSelecionada,
        selectedItemColor: IMCCores.primary,
        onTap: itemSelecionado,
      ),
    );
  }
}
