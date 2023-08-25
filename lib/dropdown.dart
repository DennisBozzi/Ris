import 'package:flutter/material.dart';

const List<String> list = <String>['Macho', 'Fêmea'];

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();

}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minWidth: 480, minHeight: 56),
      child: DropdownButton<String>(
        value: dropdownValue,
        elevation: 16,
        icon: Icon(
          Icons.arrow_drop_down_sharp,
          color: Colors.deepOrangeAccent,
        ),
        style: TextStyle(fontSize: 18),
        underline: Container(
          height: 1,
          color: Colors.deepOrangeAccent,
        ),
        onChanged: (String? value) {
          setState(() {
            dropdownValue = value!;
          });
        },
        items: list.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }

  String getSelectedValue() {
    return dropdownValue;
  }
}
