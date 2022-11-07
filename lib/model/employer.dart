const String tableEmployer = 'employers';

class EmployerFields {
  static final List<String> values = [id, name, cpf, age];
  static const String id = '_id';
  static const String name = 'employeeName';
  static const String cpf = 'employeeCpf';
  static const String age = 'employeeAge';
}

class Employer {
  final int id;
  final String name;
  final String cpf;
  final int age;

  const Employer({
    required this.id,
    required this.name,
    required this.cpf,
    required this.age,
  });

  Employer copy({
    int? id,
    String? name,
    String? cpf,
    int? age,
  }) =>
      Employer(
        id: id ?? this.id,
        name: name ?? this.name,
        cpf: cpf ?? this.cpf,
        age: age ?? this.age,
      );

  static Employer fromJson(Map<String, Object?> json) => Employer(
        id: json[EmployerFields.id] as int,
        name: json[EmployerFields.name] as String,
        cpf: json[EmployerFields.cpf] as String,
        age: json[EmployerFields.age] as int,
      );

  Map<String, Object?> toJson() => {
        EmployerFields.id: id,
        EmployerFields.name: name,
        EmployerFields.cpf: cpf,
        EmployerFields.age: age,
      };
}
