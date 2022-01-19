import 'package:flutter/material.dart';

class CustomInputOutlineWidget extends StatelessWidget {
  final TextEditingController entradaController;
  final String labelInput;
  final IconData prefixIcon;

  const CustomInputOutlineWidget(
      {Key? key,
      required this.labelInput,
      required this.entradaController,
      required this.prefixIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return TextFormField(
      cursorColor: Theme.of(context).primaryColor,
      controller: entradaController,
      style: TextStyle(
        color: Theme.of(context).primaryColor,
        fontSize: size.height * 0.02,
      ),
      decoration: InputDecoration(
          labelText: labelInput,
          labelStyle: TextStyle(
            color: Theme.of(context).primaryColor,
          )),
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value!.isEmpty) {
          return "Preencha este campo!";
        }
        return null;
      },
    );
  }
}
