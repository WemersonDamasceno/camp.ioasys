import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String titulo;
  final Function()? onPress;
  const AppBarWidget({
    Key? key,
    required this.titulo,
    this.onPress,
    this.preferredSize = const Size.fromHeight(56.0),
  }) : super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Image.asset("assets/images/logo_home.png"),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Text(
              titulo,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const Spacer(),
          onPress == null
              ? Container()
              : AnimatedContainer(
                  curve: Curves.bounceOut,
                  duration: const Duration(milliseconds: 800),
                  child: IconButton(
                    color: Colors.white,
                    onPressed: onPress,
                    icon: const Icon(
                      Icons.loop_rounded,
                      size: 30,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
