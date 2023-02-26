import 'dart:io';

import 'package:flutter_sqlite/model/product_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DbInstance {
  final String dbName = 'shin.db';
  final int dbVersion = 1;

  //Product Table
  final String? tableName = 'product';
  final String? id = 'id';
  final String? name = 'name';
  final String? category = 'category';
  final String? createdAt = 'createdAt';
  final String? updatedAt = 'updatedAt';

  Database? _database;

  //*initialize db
  Future<Database> database() async {
    if (_database != null) return _database!;

    _database = await _initDB();
    return _database!;
  }

  //*create database
  Future<Database> _initDB() async {
    // Directory docDirectory = await getApplicationDocumentsDirectory();
    // String dbPath = docDirectory.path;

    final dbPath = await getDatabasesPath();
    String path = join(dbPath, dbName);

    return await openDatabase(
      path,
      version: dbVersion,
      onCreate: _createDB,
    );
  }

  //*create database TABLE
  Future _createDB(Database db, int version) async {
    await db.execute(
      '''
      CREATE TABLE $tableName (
        $id INTEGER PRIMARY KEY AUTOINCREMENT , 
        $name TEXT NULL, 
        $category TEXT NULL, 
        $createdAt TEXT NULL, 
        $updatedAt TEXT NULL
        )
      ''',
    );
  }

  //*DISPLAY/READ data from database table
  Future<List<ProductModel>> displayDb() async {
    final data = await _database!.query(tableName!);
    List<ProductModel> result =
        data.map((e) => ProductModel.fromJson(e)).toList();
    print(result);
    return result;
  }

  //*INSERT/CREATE data into Database Table
  Future<int> insertData(Map<String, dynamic> row) async {
    final query = await _database!.insert(tableName!, row);
    return query;
  }

  //*UPDATE data function
  Future<int> updateData(int idParam, Map<String, dynamic> row) async {
    final query = await _database!
        .update(tableName!, row, where: '$id = ?', whereArgs: [idParam]);
    return query;
  }

  //*DELETE data function
  Future deleteData(int idParam) async {
    await _database!.delete(tableName!, where: '$id = ?', whereArgs: [idParam]);
  }
}
