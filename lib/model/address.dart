const String tableAddress = 'address';

class AddressFields {
  static final List<String> values = [
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

class Address {
  final String logradouro;
  final String endereco;
  final int numero;
  final String complemento;
  final String bairro;
  final String cidade;
  final String estado;
  final String cep;
  final String celular;

  const Address({
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

  Address copy({
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
      Address(
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

  static Address fromJson(Map<String, Object?> json) => Address(
        logradouro: json[AddressFields.logradouro] as String,
        endereco: json[AddressFields.endereco] as String,
        numero: json[AddressFields.numero] as int,
        complemento: json[AddressFields.complemento] as String,
        bairro: json[AddressFields.bairro] as String,
        cidade: json[AddressFields.cidade] as String,
        estado: json[AddressFields.estado] as String,
        cep: json[AddressFields.cep] as String,
        celular: json[AddressFields.celular] as String,
      );

  Map<String, Object?> toJson() => {
        AddressFields.logradouro: logradouro,
        AddressFields.endereco: endereco,
        AddressFields.numero: numero,
        AddressFields.complemento: complemento,
        AddressFields.bairro: bairro,
        AddressFields.cidade: cidade,
        AddressFields.estado: estado,
        AddressFields.cep: cep,
        AddressFields.celular: celular,
      };
}
