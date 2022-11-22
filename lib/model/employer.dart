const String tableEmployer = 'employers';

class EmployerFields {
  static final List<String> values = [
    id,
    name,
    cpf,
    age,
    logradouro,
    endereco,
    numero,
    complemento,
    bairro,
    cidade,
    estado,
    cep,
    celular
  ];
  static const String id = '_id';
  static const String name = 'employeeName';
  static const String cpf = 'employeeCpf';
  static const String age = 'employeeAge';
  static const String logradouro = 'logradouro';
  static const String endereco = 'endereco';
  static const String numero = 'numero';
  static const String complemento = 'complemento';
  static const String bairro = 'bairro';
  static const String cidade = 'cidade';
  static const String estado = 'estado';
  static const String cep = 'cep';
  static const String celular = 'celular';
}

class Employer {
  final int id;
  final String name;
  final String cpf;
  final int age;
  final String logradouro;
  final String endereco;
  final int numero;
  final String complemento;
  final String bairro;
  final String cidade;
  final String estado;
  final String cep;
  final String celular;

  const Employer({
    required this.id,
    required this.name,
    required this.cpf,
    required this.age,
    required this.logradouro,
    required this.endereco,
    required this.numero,
    required this.complemento,
    required this.bairro,
    required this.cidade,
    required this.estado,
    required this.cep,
    required this.celular,
  });

  Employer copy({
    int? id,
    String? name,
    String? cpf,
    int? age,
    String? logradouro,
    String? endereco,
    int? numero,
    String? complemento,
    String? bairro,
    String? cidade,
    String? estado,
    String? cep,
    String? celular,
  }) =>
      Employer(
        id: id ?? this.id,
        name: name ?? this.name,
        cpf: cpf ?? this.cpf,
        age: age ?? this.age,
        logradouro: logradouro ?? this.logradouro,
        endereco: endereco ?? this.endereco,
        numero: numero ?? this.numero,
        complemento: complemento ?? this.complemento,
        bairro: bairro ?? this.bairro,
        cidade: cidade ?? this.cidade,
        estado: estado ?? this.estado,
        cep: cep ?? this.cep,
        celular: celular ?? this.celular,
      );

  static Employer fromJson(Map<String, Object?> json) => Employer(
        id: json[EmployerFields.id] as int,
        name: json[EmployerFields.name] as String,
        cpf: json[EmployerFields.cpf] as String,
        age: json[EmployerFields.age] as int,
        logradouro: json[EmployerFields.logradouro] as String,
        endereco: json[EmployerFields.endereco] as String,
        numero: json[EmployerFields.numero] as int,
        complemento: json[EmployerFields.complemento] as String,
        bairro: json[EmployerFields.bairro] as String,
        cidade: json[EmployerFields.cidade] as String,
        estado: json[EmployerFields.estado] as String,
        cep: json[EmployerFields.cep] as String,
        celular: json[EmployerFields.celular] as String,
      );

  Map<String, Object?> toJson() => {
        //EmployerFields.id: id,
        EmployerFields.name: name,
        EmployerFields.cpf: cpf,
        EmployerFields.age: age,
        EmployerFields.logradouro: logradouro,
        EmployerFields.endereco: endereco,
        EmployerFields.numero: numero,
        EmployerFields.complemento: complemento,
        EmployerFields.bairro: bairro,
        EmployerFields.cidade: cidade,
        EmployerFields.estado: estado,
        EmployerFields.cep: cep,
        EmployerFields.celular: celular,
      };
}
