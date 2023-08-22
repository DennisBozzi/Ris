import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TelaFilhotes extends StatefulWidget {
  const TelaFilhotes({super.key});

  @override
  State<TelaFilhotes> createState() => _TelaFilhotesState();
}

class _TelaFilhotesState extends State<TelaFilhotes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filhotes'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Wrap(
            children: [
              Container(
                constraints: const BoxConstraints(maxWidth: 480),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextField(
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
                  child: ElevatedButton(
                    onPressed: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                      );
                    },
                    child: Text(''),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
