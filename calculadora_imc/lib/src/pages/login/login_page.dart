import 'dart:async';

import 'package:flutter/material.dart';

import 'widgets/buttom_circle_widget.dart';
import '../components/buttom_widget.dart';
import '../todo/widgets/input_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final usuarioController = TextEditingController();
  final senhaController = TextEditingController();
  bool mostrarSenha = true;
  bool habilitarBotao = true;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFC1007E),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 70),
              child: Image.asset("assets/images/login/logo_nome.png"),
            ),
            SizedBox(
              height: size.height * .75,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Seja bem vindo!",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 27,
                        ),
                      ),
                      const Text(
                        "Calculadora IMC",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              InputTextoWidget(
                                labelInput: "Usuario",
                                entradaController: usuarioController,
                                prefixIcon: Icons.person,
                                entradaTipo: TextInputType.emailAddress,
                                mostrarSenha: null,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: size.height * 0.02),
                                child: InputTextoWidget(
                                  labelInput: "Senha",
                                  entradaController: senhaController,
                                  prefixIcon: Icons.lock,
                                  sufixIcon: mostrarSenha
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  onPressIconSufix: () {
                                    setState(() {
                                      mostrarSenha = !mostrarSenha;
                                    });
                                  },
                                  entradaTipo: TextInputType.visiblePassword,
                                  mostrarSenha: mostrarSenha,
                                ),
                              ),
                              SizedBox(
                                width: size.width,
                                height: size.height * 0.06,
                                child: CustomButtomWidget(
                                  texto: "Login",
                                  onPress: fazerLogin,
                                  textColor: Colors.white,
                                  botaoColor: Colors.black,
                                  habilitarBotao: habilitarBotao,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 2,
                                      width: size.width * 0.38,
                                      color: Colors.black38,
                                    ),
                                    const Text(
                                      "ou",
                                      style: TextStyle(
                                          color: Colors.black87, fontSize: 14),
                                    ),
                                    Container(
                                      height: 2,
                                      width: size.width * 0.38,
                                      color: Colors.black38,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ButtomCircularWidget(
                                        color: Colors.white,
                                        icon:
                                            "assets/images/login/login_google.png",
                                        onPress: () {}),
                                    ButtomCircularWidget(
                                        color: Colors.white,
                                        icon:
                                            "assets/images/login/login_facebook.png",
                                        onPress: () {}),
                                    ButtomCircularWidget(
                                        color: Colors.white,
                                        icon:
                                            "assets/images/login/login_modo_anonimo.png",
                                        onPress: () {
                                          Navigator.popAndPushNamed(
                                              context, "/home");
                                        }),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "É novo por aqui?",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      //Navigator.pushNamed(context, "/singup");
                                    },
                                    child: const Text(
                                      "Crie sua conta",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  startTime() async {
    var time = const Duration(seconds: 3);
    return Timer(time, () {
      Navigator.popAndPushNamed(context, "/home");
    });
  }

  fazerLogin() {
    //Se não tiver erro
    if (_formKey.currentState!.validate()) {
      setState(() {
        habilitarBotao = !habilitarBotao;
      });

      startTime();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 3),
          content: Text('Analisando os dados, aguarde!'),
        ),
      );
    }
  }
}
