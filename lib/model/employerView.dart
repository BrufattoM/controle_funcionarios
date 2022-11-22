import 'package:controle_funcionarios/model/employer.dart';
import 'package:flutter/material.dart';

class EmployerView extends StatelessWidget {
  final Employer empregado;
  const EmployerView(this.empregado, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(top: 8, bottom: 8), 
    child: Container(
      height: 70,
      width: 40,
      decoration: BoxDecoration(
        color: Colors.white70,
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(padding: EdgeInsets.all(8),
        child: Row(children: [
          Text(empregado.name),
        ],),)
    ),);
  }
}