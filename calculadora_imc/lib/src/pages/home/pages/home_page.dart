import '../../widgets/appbar_widget.dart';
import '../../../controller/home/home_controller.dart';
import '../../widgets/buttom_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../widget/input_outline_widget.dart';

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
      appBar: AppBarWidget(
        titulo: "Calculadora IMC",
        onPress: resetarValores,
      ),
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
      ),
    );
  }

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
