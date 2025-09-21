import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/food_model.dart';

class DBHelper {
  DBHelper._privateConstructor();

  static final DBHelper instance = DBHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDataBase();
    return _database!;
  }

  Future<Database> _initDataBase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'meals.db');
    return openDatabase(path, version: 1, onCreate: _onCreateDB);
  }

  Future<void> _onCreateDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE meals(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      image TEXT NOT NULL,
      foodName TEXT NOT NULL,
      description TEXT NOT NULL,
      rate REAL,
      time TEXT NOT NULL
    )
  ''');
  }

  Future<int> insertMeal(FoodModel meal) async {
    final db = await database;
    return await db.insert('meals', meal.toMap());
  }

  Future<List<FoodModel>> getMeals() async {
    final db = await database;
    final mealsJson = await db.query('meals');
    return mealsJson.map((e) => FoodModel.fromMap(e)).toList();
  }
}
