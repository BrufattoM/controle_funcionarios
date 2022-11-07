import 'package:controle_funcionario/model/employer.dart';
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
    )
  ''');
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

  Future<List<Employer>> readAllEmployer() async {
    final db = await instance.database;

    final result = await db.query(tableEmployer);

    return result.map((json) => Employer.fromJson(json)).toList();
  }

  Future<int> update(Employer employer) async {
    final db = await instance.database;

    return db.update(
      tableEmployer,
      employer.toJson(),
      where: '${EmployerFields.id} = ?',
      whereArgs: [EmployerFields.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableEmployer,
      where: '${EmployerFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}