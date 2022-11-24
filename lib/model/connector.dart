import 'package:controle_funcionarios/model/employer.dart';
import 'package:controle_funcionarios/model/userAuth.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class EmployersDatabase {
  static final EmployersDatabase instance = EmployersDatabase._init();

  static Database? _database;

  EmployersDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('employers.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE IF NOT EXISTS $tableEmployer (
      ${EmployerFields.id} INTEGER PRIMARY KEY AUTOINCREMENT, 
      ${EmployerFields.name} TEXT NOT NULL, 
      ${EmployerFields.cpf} TEXT NOT NULL, 
      ${EmployerFields.age} INTEGER NOT NULL, 
      ${EmployerFields.logradouro} TEXT NOT NULL, 
      ${EmployerFields.endereco} TEXT NOT NULL, 
      ${EmployerFields.numero} INTEGER NOT NULL, 
      ${EmployerFields.complemento} TEXT NOT NULL, 
      ${EmployerFields.bairro} TEXT NOT NULL, 
      ${EmployerFields.cidade} TEXT NOT NULL, 
      ${EmployerFields.estado} TEXT NOT NULL, 
      ${EmployerFields.cep} TEXT NOT NULL, 
      ${EmployerFields.celular} TEXT NOT NULL)''');

    await db.execute('''
    CREATE TABLE IF NOT EXISTS $tableUser (
      ${UserFields.id} INTEGER PRIMARY KEY AUTOINCREMENT,
      ${UserFields.user} TEXT NOT NULL,
      ${UserFields.password} TEXT NOT NULL,
      ${UserFields.level} INTEGER NOT NULL)''');

    const UserAuth AdmlUser = UserAuth(id: 0, user: 'admin', password: 'admin', level: 0);
    const UserAuth NeutrallUser = UserAuth(id: 0, user: 'user', password: 'user', level: 1);
    await db.insert(tableUser, AdmlUser.toJson());
    await db.insert(tableUser, NeutrallUser.toJson());
  }

  Future<Employer> create(Employer employer) async {
    final db = await instance.database;

    final id = await db.insert(tableEmployer, employer.toJson());

    return employer.copy(id: id);
  }

  Future<Employer> readEmployer(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableEmployer,
      columns: EmployerFields.values,
      where: '${EmployerFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Employer.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<UserAuth> readUser(String userName) async {
    final db = await instance.database;

    final maps = await db.query(
      tableUser,
      columns: UserFields.values,
      where: '${UserFields.user} = ?',
      whereArgs: [userName],
    );

    if (maps.isNotEmpty) {
      return UserAuth.fromJson(maps.first);
    } else {
      throw Exception('ID $userName not found');
    }
  }

  Future<List<Employer>> readAllEmployer() async {
    final db = await instance.database;

    final result = await db.query(tableEmployer);

    return result.map((json) => Employer.fromJson(json)).toList();
  }

  Future<int> update(Employer employer) async {
    final db = await instance.database;
    db.update(
      tableEmployer,
      employer.toJson(),
      where: '${EmployerFields.id} = ?',
      whereArgs: [employer.id],
    );
    return 0;
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    await db.delete(
      tableEmployer,
      where: '${EmployerFields.id} = ?',
      whereArgs: [id],
    );

    return 0;
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
