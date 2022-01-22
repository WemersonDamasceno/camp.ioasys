import '../controllers/todo_controller.dart';

import 'package:flutter/material.dart';

class ListTodosWidget extends StatelessWidget {
  final ControllerTodo controller;
  final Function(bool?, int) onPress;
  final TextStyle? textStyle;
  final Color? cardColor;
  final bool listCheck;
  final Function(DismissDirection, int) onDismiss;

  const ListTodosWidget({
    Key? key,
    required this.controller,
    required this.onPress,
    this.textStyle,
    this.cardColor,
    required this.listCheck,
    required this.onDismiss,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: listCheck
          ? controller.listTodosCompletas.length
          : controller.listTodosIncompletas.length,
      itemBuilder: (_, index) {
        var item = listCheck
            ? controller.listTodosCompletas[index]
            : controller.listTodosIncompletas[index];
        return Card(
          color: cardColor ?? Colors.white,
          elevation: 2,
          child: Dismissible(
            onDismissed: (direction) => onDismiss(direction, index),
            direction: DismissDirection.startToEnd,
            key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
            child: CheckboxListTile(
              value: item.isCheck,
              onChanged: (v) => onPress(v, index),
              title: Text(
                item.titulo,
                style: textStyle ??
                    const TextStyle(
                      fontSize: 14,
                    ),
              ),
            ),
            background: Container(
              color: Theme.of(context).colorScheme.error,
              child: const Align(
                alignment: Alignment(-0.9, 0),
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
