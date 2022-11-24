import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../model/connector.dart';
import '../model/userAuth.dart';
import 'listEmployerView.dart';

class LogginView extends StatefulWidget {
  const LogginView({super.key});

  @override
  State<LogginView> createState() => _LogginViewState();
}

class _LogginViewState extends State<LogginView> {
  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final GlobalKey<FormState> _formKeyy = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loggin'),
      ),
      body: Form(child: Container(
        key: _formKeyy,
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'UserName',
                    border: OutlineInputBorder(),
                    fillColor: Colors.white70,
                    filled: true,
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo obrigatório';
                    }
                    return null;
                  },
                  controller: userController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(),
                    fillColor: Colors.white70,
                    filled: true,
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo obrigatório';
                    }
                    return null;
                  },
                  controller: passController,
                ),
              ),
               Padding(
                    padding: const EdgeInsets.all(14),
                    child: ElevatedButton(
                      onPressed: () async {
                        // Validate will return true if the form is valid, or false if
                        // the form is invalid.
                      var data = await EmployersDatabase.instance.readUser(userController.text);
                        if(data.user == userController.text && data.password == passController.text) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ListViewEmployers(),
                            ),
                          );
                        }else{
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Erro ao validar Usuário'))
                        );
                        }
                        }
                      ,
                      child: const Text('Enter'),
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}