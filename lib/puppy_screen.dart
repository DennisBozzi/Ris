import 'package:flutter/material.dart';
import 'widgets_customizados.dart';

class PuppyScreen extends StatefulWidget {
  const PuppyScreen({super.key});

  @override
  State<PuppyScreen> createState() => _PuppyScreenState();
}

bool _isChecked = false;

class _PuppyScreenState extends State<PuppyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Wrap(
            verticalDirection: VerticalDirection.down,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Text(
                      'Novo Pássaro',
                      style: TextStyle(fontSize: 24, color: Colors.grey, fontWeight: FontWeight.bold),
                    ),
                  ),
                  paddingComTextField('Nome', 'Mãe'),
                  paddingComTextField('Pai', 'Sexo'),
                  paddingComTextField('Anilha Ibama', 'Anilha Marcação'),
                  paddingComTextField('Data de Nascimento', 'Raça'),
                  paddingComTextField('Avô Paterno', 'Avó Parteno'),
                  paddingComTextField('Avô Materno', 'Avó Materno'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Checkbox(
                        value: _isChecked,
                        checkColor: Colors.white,
                        activeColor: Colors.grey,
                        onChanged: (bool? value) {
                          setState(() {
                            _isChecked = value!;
                          });
                        },
                      ),
                      const Flexible(
                        child: Text('Filhote'),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: botao('Cadastrar', context),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.white10,
        child: const Icon(
          Icons.adb,
          color: Colors.grey,
        ),
      ),
    );
  }
}
