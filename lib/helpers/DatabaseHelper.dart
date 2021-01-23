import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:trying_app/models/TryingEntry.dart';

class DatabaseHelper {
  // instance variables
  Database _database;

  // database table and column names
  static final _databaseName = "TryingDatabase.db";
  static final tableEntries = 'entries';
  static final columnDate = 'date';
  static final columnIsMedTaken = 'isMedTaken';
  static final columnMedDescription = 'medDescription';
  static final columnGratitude = 'gratitude';
  static final columnFeeling = 'feeling';
  static final columnFeelingJournal = 'feelingJournal';

  // Singleton instance and constructor
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // Get database
  Future<Database> get database async {
    if (_database != null) { return _database; }
    else {
      _database = await _initDatabase();
      return _database;
    }
  }

  // Open database from file
  _initDatabase() async {
    Directory docDirectory = await getApplicationDocumentsDirectory();
    String path = join(docDirectory.path, _databaseName);
    return await openDatabase(path, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(
        '''
              CREATE TABLE $tableEntries (
                $columnDate INTEGER PRIMARY KEY,
                $columnIsMedTaken INTEGER NOT NULL,
                $columnMedDescription TEXT NOT NULL,
                $columnGratitude TEXT NOT NULL,
                $columnFeeling TEXT NOT NULL,
                $columnFeelingJournal TEXT NOT NULL,
              )
        '''
    );
  }

  Future updateEntry(TryingEntry entry) async {
    Map<String, dynamic> newMap = entry.toMap();
    await _database.update(tableEntries, newMap, where: columnDate + ' = ?', whereArgs: newMap[columnDate]);
  }


}