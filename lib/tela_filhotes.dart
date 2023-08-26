import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'database/Passaro.dart';
import 'database/PassaroDAO.dart';
import 'widgets_customizados.dart';

class TelaFilhotes extends StatefulWidget {
  const TelaFilhotes({super.key});

  @override
  State<TelaFilhotes> createState() => _TelaFilhotesState();
}

enum Genero {
  macho,
  femea,
}

class _TelaFilhotesState extends State<TelaFilhotes> {
  final generos = ['Macho', 'Fêmea'];

  String? nome, pai, mae, anilhaSispass, anilhaMarcacao, avo1, avo2, avo3, avo4;

  String? dropdownValue = 'Macho';
  String? dropdownRaca = 'Trinca-Ferro';

  DateTime dataNascimento = DateTime.now();

  bool isFilhoteSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pássaros'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Container(
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
                            padding: const EdgeInsets.all(16.0),
                            child: TextField(
                              onChanged: (text) {
                                nome = text;
                              },
                              decoration: const InputDecoration(
                                hintText: 'Nome',
                              ),
                            ),
                          ),
                        ),
                        Container(
                          constraints: const BoxConstraints(maxWidth: 480),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: TextField(
                              onChanged: (text) {
                                pai = text;
                              },
                              decoration: const InputDecoration(
                                hintText: 'Pai',
                              ),
                            ),
                          ),
                        ),
                        Container(
                          constraints: const BoxConstraints(maxWidth: 480),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: TextField(
                              onChanged: (text) {
                                mae = text;
                              },
                              decoration: const InputDecoration(
                                hintText: 'Mãe',
                              ),
                            ),
                          ),
                        ),
                        Container(
                          constraints: const BoxConstraints(
                              maxWidth: 480, minHeight: 88),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: DropdownButton<String>(
                              items: const [
                                DropdownMenuItem(
                                  value: 'Macho',
                                  child: Text('Macho'),
                                ),
                                DropdownMenuItem(
                                  value: 'Fêmea',
                                  child: Text('Fêmea'),
                                )
                              ],
                              value: dropdownValue,
                              elevation: 16,
                              onChanged: (dropdownValue) => setState(
                                  () => this.dropdownValue = dropdownValue),
                              isExpanded: true,
                              underline: Container(
                                height: 1,
                                color: Colors.deepOrangeAccent,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          constraints: const BoxConstraints(maxWidth: 480),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: TextField(
                              onChanged: (text) {
                                anilhaSispass = text;
                              },
                              decoration: const InputDecoration(
                                hintText: 'Anilha SISPASS',
                              ),
                            ),
                          ),
                        ),
                        Container(
                          constraints: const BoxConstraints(maxWidth: 480),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: TextField(
                              onChanged: (text) {
                                anilhaMarcacao = text;
                              },
                              decoration: const InputDecoration(
                                hintText: 'Anilha Marcação',
                              ),
                            ),
                          ),
                        ),
                        Container(
                          constraints: const BoxConstraints(
                              maxWidth: 480, minHeight: 88),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: DropdownButton<String>(
                              items: const [
                                DropdownMenuItem(
                                  value: 'Trinca-Ferro',
                                  child: Text('Trinca-Ferro'),
                                ),
                                DropdownMenuItem(
                                  value: 'Coleiro',
                                  child: Text('Coleiro'),
                                )
                              ],
                              value: dropdownRaca,
                              elevation: 16,
                              onChanged: (dropdownValue) => setState(
                                  () => this.dropdownRaca = dropdownValue),
                              isExpanded: true,
                              underline: Container(
                                height: 1,
                                color: Colors.deepOrangeAccent,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          constraints: const BoxConstraints(maxWidth: 480),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 12.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Colors.deepOrangeAccent,
                                        minimumSize: const Size(480, 48)),
                                    onPressed: () async {
                                      final newDate = await showDatePicker(
                                        context: context,
                                        initialDate: dataNascimento,
                                        firstDate: DateTime(1995),
                                        lastDate: DateTime(2101),
                                      );
                                      if (newDate != null) {
                                        setState(() {
                                          dataNascimento = newDate;
                                        });
                                      }
                                    },
                                    child: Text(
                                      DateFormat('dd/MM/yyyy')
                                          .format(dataNascimento),
                                      style: const TextStyle(fontSize: 18),
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
                            padding: const EdgeInsets.all(16.0),
                            child: TextField(
                              onChanged: (text) {
                                avo1 = text;
                              },
                              decoration: const InputDecoration(
                                hintText: 'Avô Paterno',
                              ),
                            ),
                          ),
                        ),
                        Container(
                          constraints: const BoxConstraints(maxWidth: 480),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: TextField(
                              onChanged: (text) {
                                avo2 = text;
                              },
                              decoration: const InputDecoration(
                                hintText: 'Avó Paterno',
                              ),
                            ),
                          ),
                        ),
                        Container(
                          constraints: const BoxConstraints(maxWidth: 480),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: TextField(
                              onChanged: (text) {
                                avo3 = text;
                              },
                              decoration: const InputDecoration(
                                hintText: 'Avô Materno',
                              ),
                            ),
                          ),
                        ),
                        Container(
                          constraints: const BoxConstraints(maxWidth: 480),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: TextField(
                              onChanged: (text) {
                                avo4 = text;
                              },
                              decoration: const InputDecoration(
                                hintText: 'Avó Materno',
                              ),
                            ),
                          ),
                        ),
                        Container(
                          constraints: const BoxConstraints(maxWidth: 480),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text('Filhote'),
                                    Checkbox(
                                      checkColor: Colors.white,
                                      fillColor:
                                          MaterialStateProperty.resolveWith(
                                              getColor),
                                      value: isFilhoteSelected,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          isFilhoteSelected = value!;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 48.0),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      PassaroDAO.addPassaro(Passaro(
                                          nome: nome,
                                          pai: pai,
                                          mae: mae,
                                          sexo: dropdownValue,
                                          sispass: anilhaSispass,
                                          marcacao: anilhaMarcacao,
                                          nascimento: dataNascimento,
                                          avo1: avo1,
                                          avo2: avo2,
                                          avo3: avo3,
                                          avo4: avo4,
                                          filhote: isFilhoteSelected ? 1 : 0));
                                      print(
                                          'Nome: $nome, Pai: $pai, Mãe: $mae, Sexo: $dropdownValue, SISPASS: $anilhaSispass,'
                                          'Marcação: $anilhaMarcacao, Data de Nascimento: $dataNascimento, Avô Paterno: $avo1, '
                                          'Avó Paterno: $avo2, Avô Materno: $avo3, '
                                          'Avó Materno: $avo4, Filhote: $isFilhoteSelected');
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Colors.deepOrangeAccent,
                                        minimumSize: const Size(480, 56)),
                                    child: const Text(
                                      'Cadastrar',
                                      style: TextStyle(fontSize: 20),
                                    ),
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
              )),
        ),
      ),
    );
  }
}
