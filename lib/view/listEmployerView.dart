import 'package:controle_funcionarios/view/registrationView.dart';
import 'package:flutter/material.dart';

import '../model/connector.dart';
import '../model/employer.dart';
import '../model/employerView.dart';

class ListViewEmployers extends StatefulWidget {
  const ListViewEmployers({super.key});

  @override
  State<ListViewEmployers> createState() => _ListViewEmployersState();
}

class _ListViewEmployersState extends State<ListViewEmployers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: const Icon(Icons.autorenew_sharp))
        ],
        title: const Text('Funcionarios'),
        leading: Container(),
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
                  return const Text('Não há empregados');
                }
                return const Text('Erro ao conectar com o banco');
              case ConnectionState.active:
                // TODO: Handle this case.
                break;
            }
            return const Text('Erro desconhecido');
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