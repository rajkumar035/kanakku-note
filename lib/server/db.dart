import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseServices {
  static Database? _db;
  static final DatabaseServices instance = DatabaseServices._constructor();
  DatabaseServices._constructor();

  // Tables
  final String cartProductsList = "cartProductsList";
  final String storeDataList = "storeDataList";

  // Fields list
  // cartProductsList
  final String cartProductsListId = "id";
  final String cartProductsListName = "name";
  final String cartProductsListQty = "quantity";
  final String cartProductsListAmount = "amount";
  final String cartProductsListGrossAmount = "grossAmount";
  final String cartProductsListDiscount = "discount";
  final String carrtCustomerIdentity = "customerIdentity";

  // storeDataList
  final String storeId = "clitkn";
  final String storeEntityCode = "entitycode";
  final String storeTenant = "tenant";
  final String storeStartDate = "startdt";
  final String storeEndDate = "enddt";
  final String storeReminderDate = "remdate";
  final String storeReminderMessage = "remmsg";
  final String storeBaseUrl = "entityurl";

  Future<Database> getDatabase() async {
    final dataBasePath = await getDatabasesPath();
    final path = join(dataBasePath, "main_db.db");

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute("""
        CREATE TABLE IF NOT EXISTS $cartProductsList (
          $cartProductsListId TEXT PRIMARY KEY,
          $cartProductsListName TEXT NOT NULL,
          $cartProductsListQty INTEGER NOT NULL,
          $cartProductsListAmount INTEGER NOT NULL,
          $cartProductsListGrossAmount REAL NOT NULL,
          $cartProductsListDiscount REAL,
          $carrtCustomerIdentity REAL
        )
      """);

        await db.execute("""
        CREATE TABLE IF NOT EXISTS $storeDataList (
          $storeId TEXT PRIMARY KEY,
          $storeEntityCode TEXT NOT NULL,
          $storeTenant TEXT NOT NULL,
          $storeStartDate TEXT NOT NULL,
          $storeEndDate TEXT NOT NULL,
          $storeReminderDate TEXT NOT NULL,
          $storeReminderMessage TEXT,
          $storeBaseUrl TEXT
        )
      """);
      },
    );
  }

  Future<Database> get database async {
    if (_db != null) {
      return _db!;
    }
    _db = await getDatabase();
    return _db!;
  }

  Future<void> addData(String table, Map<String, dynamic> data) async {
    final db = await database;
    await db.insert(
      table,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await database;
    return db.query(
      table,
    );
  }

  Future<void> deleteData(String id, String table) async {
    final db = await database;
    await db.delete(
      table,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> close() async {
    final db = await database;
    await db.close();
  }
}
