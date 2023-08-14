import 'dart:ffi';

import 'package:flutter/material.dart';
import 'widgets_customizados.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /*Image
          const ClipOval(
            child: Image(
              image: AssetImage('images/trinca.jpg'),
              width: 240,
              height: 240,
              fit: BoxFit.cover,
            ),
          ),*/
          Center(
            child: Wrap(
              alignment: WrapAlignment.spaceAround,
              spacing: 80,
              runSpacing: 40,
              children: [botao('Filhote', context), botao('Macho', context), botao('Fêmea', context), botao('Indefinido', context)],
            ),
          )
        ],
      ),
    );
  }
}
