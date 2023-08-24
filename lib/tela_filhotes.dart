import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ris/checkbox.dart';
import 'database/Passaro.dart';
import 'dropdown.dart';
import 'database/PassaroDAO.dart';

class TelaFilhotes extends StatefulWidget {
  const TelaFilhotes({super.key});

  @override
  State<TelaFilhotes> createState() => _TelaFilhotesState();
}

class _TelaFilhotesState extends State<TelaFilhotes> {
  String nome = '';
  String pai = '';
  String mae = '';
  String dropdownValue = '';
  DateTime dataNascimento = DateTime.now();
  String avo1 = '';
  String avo2 = '';
  String avo3 = '';
  String avo4 = '';
  bool isFilhoteSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pássaros'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Wrap(
            children: [
              Wrap(
                alignment: WrapAlignment.center,
                children: [
                  Container(
                    constraints: const BoxConstraints(maxWidth: 480),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: TextField(
                        onChanged: (text) {
                          nome = text;
                        },
                        decoration: InputDecoration(
                          hintText: 'Nome',
                        ),
                      ),
                    ),
                  ),
                  Container(
                    constraints: const BoxConstraints(maxWidth: 480),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: TextField(
                        onChanged: (text) {
                          pai = text;
                        },
                        decoration: InputDecoration(
                          hintText: 'Pai',
                        ),
                      ),
                    ),
                  ),
                  Container(
                    constraints: const BoxConstraints(maxWidth: 480),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: TextField(
                        onChanged: (text) {
                          mae = text;
                        },
                        decoration: InputDecoration(
                          hintText: 'Mãe',
                        ),
                      ),
                    ),
                  ),
                  Container(
                    constraints: const BoxConstraints(maxWidth: 480),
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: DropdownButtonExample(),
                    ),
                  ),
                  Container(
                    constraints: const BoxConstraints(maxWidth: 480),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: Column(
                        children: [
                          Text(
                            'Data de nascimento',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 4, bottom: 16, right: 16, left: 16),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrangeAccent, minimumSize: Size(480, 48)),
                              onPressed: () async {
                                final newDate = await showDatePicker(
                                  context: context,
                                  initialDate: dataNascimento,
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2101),
                                );
                                if (newDate != null) {
                                  setState(() {
                                    dataNascimento = newDate;
                                  });
                                }
                              },
                              child: Text(
                                DateFormat('dd/MM/yyyy').format(dataNascimento),
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Wrap(
                alignment: WrapAlignment.center,
                children: [
                  Container(
                    constraints: const BoxConstraints(maxWidth: 480),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: TextField(
                        onChanged: (text) {
                          avo1 = text;
                        },
                        decoration: InputDecoration(
                          hintText: 'Avô Paterno',
                        ),
                      ),
                    ),
                  ),
                  Container(
                    constraints: const BoxConstraints(maxWidth: 480),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: TextField(
                        onChanged: (text) {
                          avo2 = text;
                        },
                        decoration: InputDecoration(
                          hintText: 'Avó Paterno',
                        ),
                      ),
                    ),
                  ),
                  Container(
                    constraints: const BoxConstraints(maxWidth: 480),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: TextField(
                        onChanged: (text) {
                          avo3 = text;
                        },
                        decoration: InputDecoration(
                          hintText: 'Avô Materno',
                        ),
                      ),
                    ),
                  ),
                  Container(
                    constraints: const BoxConstraints(maxWidth: 480),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: TextField(
                        onChanged: (text) {
                          avo4 = text;
                        },
                        decoration: InputDecoration(
                          hintText: 'Avó Materno',
                        ),
                      ),
                    ),
                  ),
                  Container(
                    constraints: const BoxConstraints(maxWidth: 480),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Text('Filhote'), CheckboxExample()],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 48.0),
                            child: ElevatedButton(
                              onPressed: () {
                                print('Nome: $nome, Pai: $pai, Mãe: $mae, Dropdown Value: $dropdownValue, '
                                    'Data de Nascimento: $dataNascimento, Avô Paterno: $avo1, '
                                    'Avó Paterno: $avo2, Avô Materno: $avo3, '
                                    'Avó Materno: $avo4, Filhote: $isFilhoteSelected');
                                Passaro novoPassaro = Passaro(nome, pai);
                                PassaroDAO.addPassaro(novoPassaro);
                              },
                              child: const Text(
                                'Cadastrar',
                                style: TextStyle(fontSize: 20),
                              ),
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrangeAccent, minimumSize: Size(480, 56)),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
