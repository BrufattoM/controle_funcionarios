import 'package:controle_funcionarios/model/connector.dart';
import 'package:controle_funcionarios/view/listEmployerView.dart';
import 'package:controle_funcionarios/view/loginView.dart';
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
  bool isLoggedIn = false;

  Widget viewBuilder(){
    if(!isLoggedIn){
      return const LogginView();
    }
    return const ListViewEmployers();
    
  }
  @override
  Widget build(BuildContext context) {
    return viewBuilder();
  }
}
