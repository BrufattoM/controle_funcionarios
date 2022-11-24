const String tableUser = 'usersAuth';

class UserFields {
  static final List<String> values = [
    id,
    user,
    password,
    level
  ];
  static const String id = '_id';
  static const String user = 'user';
  static const String password = 'password';
  static const String level = 'level';
}

class UserAuth {
  final int id;
  final String user;
  final String password;
  final int level;

  const UserAuth({
    required this.id,
    required this.user,
    required this.password,
    required this.level
  });

  UserAuth copy({
    int? id,
    String? user,
    String? password,
    int? level,
  }) =>
      UserAuth(
        id: id ?? this.id,
        user: user ?? this.user,
        password: password ?? this.password,
        level: level ?? this.level
      );

  static UserAuth fromJson(Map<String, Object?> json) => UserAuth(
        id: json[UserFields.id] as int,
        user: json[UserFields.user] as String,
        password: json[UserFields.password] as String,
        level: json[UserFields.level] as int
      );


  Map<String, Object?> toJson() => {
        //UserFields.id: id,
        UserFields.user: user,
        UserFields.password:  password,
        UserFields.level: level,
      };

}