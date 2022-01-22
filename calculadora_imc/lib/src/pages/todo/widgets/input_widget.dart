import 'package:flutter/material.dart';

class InputTextoWidget extends StatelessWidget {
  final TextEditingController entradaController;
  final TextInputType entradaTipo;
  final Color? color;
  final bool? mostrarSenha;
  final String labelInput;
  final IconData? sufixIcon;
  final IconData prefixIcon;
  final GestureTapCallback? onPressIconSufix;
  final GestureTapCallback? onPressIconPrefix;

  const InputTextoWidget(
      {Key? key,
      required this.labelInput,
      required this.entradaController,
      required this.entradaTipo,
      required this.mostrarSenha,
      required this.prefixIcon,
      this.onPressIconSufix,
      this.sufixIcon,
      this.onPressIconPrefix,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return TextFormField(
      cursorColor: Colors.white,
      obscureText: mostrarSenha ?? false,
      controller: entradaController,
      style: TextStyle(
        color: Colors.white,
        fontSize: size.height * 0.02,
      ),
      keyboardType: entradaTipo,
      decoration: InputDecoration(
        fillColor: color ?? const Color(0xFFC5007E),
        filled: true,
        contentPadding: EdgeInsets.only(right: -size.width * 0.05),
        labelText: labelInput,
        labelStyle: const TextStyle(
          color: Colors.white,
        ),
        alignLabelWithHint: true,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(7),
          ),
        ),
        prefixIcon: Icon(
          prefixIcon,
          color: Colors.white,
        ),
        errorStyle: const TextStyle(color: Colors.white),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(7),
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(7),
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(7),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(7),
          ),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            sufixIcon,
            color: Colors.white,
          ),
          onPressed: onPressIconSufix,
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "Preencha este campo!";
        }
        //Se for email, verificar se possui mais de 6 caracteres!
        if (entradaTipo.toString() ==
                TextInputType.visiblePassword.toString() &&
            value.length < 6) {
          return "A senha deve ter no minimo 6 digitos!";
        }

        return null;
      },
    );
  }
}
