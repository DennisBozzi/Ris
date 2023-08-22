import 'package:flutter/material.dart';
import 'package:ris/tela_filhotes.dart';

//Botões do Início (Filhote - Macho - Fêmea )
Container botao(String texto, BuildContext context) {
  return Container(
    width: 160,
    height: 40,
    child: TextButton(
      onPressed: () {
        selecionaTela(texto, context);
      },
      child: Text(
        texto,
        style: TextStyle(fontSize: 24, color: Colors.grey),
      ),
    ),
  );
}

//Te encaminha para a tela selecionada
void selecionaTela(String opcao, BuildContext context) {
  switch (opcao) {
    case "Filhote":
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TelaFilhotes()),
      );
      break;

    case "Macho":
      print('Macho');
      break;

    case "Fêmea":
      print('Fêmea');
      break;

    case "Cadastrar":

      break;

    default:
      print('Opção não definida');
  }
}

