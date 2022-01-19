import 'package:calculadora_imc/src/controller/home/home_controller.dart';
import 'package:calculadora_imc/src/pages/widgets/buttom_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'widget/input_outline_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final homeController = HomeController();
  final _formKey = GlobalKey<FormState>();
  late final AnimationController _controllerCheckbox;
  final pesoController = TextEditingController();
  final alturaController = TextEditingController();

  bool animation = false;
  String resultado = "";

  @override
  void initState() {
    _controllerCheckbox = AnimationController(vsync: this);
    _controllerCheckbox.duration = const Duration(milliseconds: 3500);
    _controllerCheckbox.forward();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controllerCheckbox.dispose();
    pesoController.dispose();
    alturaController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            title: appBarCustom()),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: LottieBuilder.asset(
                      "assets/images/person_animation.json",
                      width: 150,
                      height: 150,
                      controller: _controllerCheckbox,
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        CustomInputOutlineWidget(
                          entradaController: pesoController,
                          labelInput: "Peso (kg)",
                          prefixIcon: Icons.anchor_rounded,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: CustomInputOutlineWidget(
                            labelInput: "Altura (cm)",
                            entradaController: alturaController,
                            prefixIcon: Icons.height,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width,
                    child: CustomButtomWidget(
                      texto: "Calcular",
                      onPress: calcularIMC,
                      textColor: Colors.white,
                      botaoColor: Theme.of(context).primaryColor,
                      habilitarBotao: true,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(resultado),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Widget appBarCustom() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Image.asset("assets/images/logo_home.png"),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 4.0),
            child: Text(
              "Calculadora IMC",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const Spacer(),
          AnimatedContainer(
            curve: Curves.bounceOut,
            duration: const Duration(milliseconds: 800),
            child: IconButton(
              onPressed: resetarValores,
              icon: const Icon(
                Icons.loop_rounded,
                size: 30,
              ),
            ),
          ),
        ],
      );

  calcularIMC() {
    //Se não tiver erro
    if (_formKey.currentState!.validate()) {
      setState(() {
        resultado = homeController.calcularIMC(
            alturaController.text, pesoController.text);

        _controllerCheckbox.reset();
        _controllerCheckbox.forward();
      });
    }
  }

  resetarValores() {
    setState(() {
      resultado = "";
      alturaController.clear();
      pesoController.clear();
    });
  }
}
