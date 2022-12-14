import 'package:controle_funcionarios/model/connector.dart';
import 'package:controle_funcionarios/model/employer.dart';
import 'package:flutter/material.dart';

class RegistrationEmp extends StatefulWidget {
  const RegistrationEmp({super.key});

  @override
  State<RegistrationEmp> createState() => _RegistrationEmpState();
}

class _RegistrationEmpState extends State<RegistrationEmp> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController idadeController = TextEditingController();
  TextEditingController logradouroController = TextEditingController();
  TextEditingController enderecoController = TextEditingController();
  TextEditingController numeroController = TextEditingController();
  TextEditingController complementoController = TextEditingController();
  TextEditingController bairroController = TextEditingController();
  TextEditingController cidadeController = TextEditingController();
  TextEditingController estadoController = TextEditingController();
  TextEditingController cepController = TextEditingController();
  TextEditingController celularController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registro de Empregado')),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 3),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Nome',
                        border: OutlineInputBorder(),
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Campo obrigat??rio';
                        }
                        return null;
                      },
                      controller: nomeController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'CPF',
                        border: OutlineInputBorder(),
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Campo obrigat??rio';
                        }
                        return null;
                      },
                      controller: cpfController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Idade',
                        border: OutlineInputBorder(),
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Campo obrigat??rio';
                        }
                        return null;
                      },
                      controller: idadeController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Logradouro',
                        border: OutlineInputBorder(),
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Campo obrigat??rio';
                        }
                        return null;
                      },
                      controller: logradouroController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Endere??o',
                        border: OutlineInputBorder(),
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Campo obrigat??rio';
                        }
                        return null;
                      },
                      controller: enderecoController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'N??mero',
                        border: OutlineInputBorder(),
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Campo obrigat??rio';
                        }
                        return null;
                      },
                      controller: numeroController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Complemento',
                        border: OutlineInputBorder(),
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Campo obrigat??rio';
                        }
                        return null;
                      },
                      controller: complementoController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Bairro',
                        border: OutlineInputBorder(),
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Campo obrigat??rio';
                        }
                        return null;
                      },
                      controller: bairroController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Cidade',
                        border: OutlineInputBorder(),
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Campo obrigat??rio';
                        }
                        return null;
                      },
                      controller: cidadeController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Estado',
                        border: OutlineInputBorder(),
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Campo obrigat??rio';
                        }
                        return null;
                      },
                      controller: estadoController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'CEP',
                        border: OutlineInputBorder(),
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Campo obrigat??rio';
                        }
                        return null;
                      },
                      controller: cepController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Celular',
                        border: OutlineInputBorder(),
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Campo obrigat??rio';
                        }
                        return null;
                      },
                      controller: celularController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(14),
                    child: ElevatedButton(
                      onPressed: () {
                        // Validate will return true if the form is valid, or false if
                        // the form is invalid.
                        if (_formKey.currentState!.validate()) {
                          EmployersDatabase.instance.create(Employer(
                            id: 0,
                            name: nomeController.text,
                            cpf: cpfController.text,
                            age: int.parse(idadeController.text),
                            logradouro: logradouroController.text,
                            endereco: enderecoController.text,
                            numero: int.parse(numeroController.text),
                            complemento: complementoController.text,
                            bairro: bairroController.text,
                            cidade: cidadeController.text,
                            estado: estadoController.text,
                            cep: cepController.text,
                            celular: celularController.text,
                          ));
                          Navigator.pop(context);
                        }
                      },
                      child: const Text('Submit'),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
