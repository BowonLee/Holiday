import 'package:holiday/model/holiday/holiday.dart';
import 'package:sqflite/sqflite.dart';

class SQLManager {
  late Database _database;

  SQLManager() {
    _init();
  }

  Future<void> _init() async {
    var databasePath = getDatabasesPath();
    // String path =

    Database database = await openDatabase("local_db", version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE Holiday (id INTEGER PRIMARY KEY, date DATE, date_name TEXT, date_Kind TEXT, isHoliday BOOLEAN)');
    });

    _database = database;
  }

  void insertHoliday(Holiday holiday) {
    _database.insert("Holiday", holiday.toJson());
  }

  void insertHolidayList(List<Holiday> holdayList) {
    holdayList.forEach((holiday) {
      _database.insert("Holiday", holiday.toJson());
    });
  }

  Future<List<Map<String, Object?>>> getHolidayByYear(String year) {
    return _database.rawQuery('SELECT * from Holiday where year = ?', [year]);
  }

  Future<List<Map<String, Object?>>> getHoliday() {
    return _database.rawQuery('SELECT * from Holiday');
  }
}
/**
 * single table
 * id
 * date
 * dateName
 * dateKind
 * isHoliday
 *
 *
 */
