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
          Center(
            child: Wrap(
              alignment: WrapAlignment.spaceAround,
              spacing: 80,
              runSpacing: 40,
              children: [
                botao('Filhote', context),
                botao('Macho', context),
                botao('Fêmea', context),
                botao('Indefinido', context)
              ],
            ),
          )
        ],
      ),
    );
  }
}
