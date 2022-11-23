import 'package:controle_funcionarios/model/connector.dart';
import 'package:controle_funcionarios/view/registrationView.dart';
import 'package:flutter/material.dart';

import 'model/employer.dart';
import 'model/employerView.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Funcionarios',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: const MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: Icon(Icons.autorenew_sharp))
        ],
        title: const Text('Funcionarios'),
        leading: Text(''),
      ),
      body: FutureBuilder<List<Employer>>(
          future: EmployersDatabase.instance.readAllEmployer(),
          builder: (context, snapshot) {
            List<Employer>? items = snapshot.data;
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                break;
              case ConnectionState.waiting:
                break;
              case ConnectionState.done:
                if (snapshot.hasData && items != null) {
                  if (items.isNotEmpty) {
                    return ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (BuildContext context, int index) {
                          Employer empregado = items[index];
                          return EmployerView(empregado);
                        });
                  }
                  return Text('Não há empregados');
                }
                return Text('Erro ao conectar com o banco');
                break;
              case ConnectionState.active:
                // TODO: Handle this case.
                break;
            }
            return Text('Erro desconhecido');
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const RegistrationEmp(),
            ),
          ).then((value) => setState(() {}));
        },
        backgroundColor: Colors.brown,
        child: const Icon(Icons.add),
      ),
    );
  }
}
