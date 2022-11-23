import 'package:controle_funcionarios/model/connector.dart';
import 'package:controle_funcionarios/model/employer.dart';
import 'package:controle_funcionarios/view/editingView.dart';
import 'package:flutter/material.dart';

import '../view/registrationView.dart';

class EmployerView extends StatelessWidget {
  final Employer empregado;
  const EmployerView(this.empregado, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Container(
        height: 55,
        decoration: BoxDecoration(
          color: Colors.white70,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(empregado.name),
              Container(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditEmployer(
                          empregado: empregado,
                        ),
                      ),
                    );
                  },
                  onLongPress: () {
                    EmployersDatabase.instance.delete(empregado.id);
                  },
                  child: Icon(Icons.brush),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
