import 'package:flutter/material.dart';
import 'puppy_screen.dart';

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
        MaterialPageRoute(builder: (context) => PuppyScreen()),
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

/*------------------------------------------------------------------------------*/

//TextFields para cadastro de pássaros
Container textField(String texto) {
  return Container(
      width: 320,
      child: TextField(
        decoration: InputDecoration(hintText: texto),
      ));
}

Padding paddingComTextField(String texto1, String texto2) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 40),
    child: Wrap(
      spacing: 80,
      runSpacing: 40,
      children: [textField(texto1), textField(texto2)],
    ),
  );
}
