import 'package:la_vie_web/data/model/cart/cart_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../app_core/local_db_constants.dart';

class SqlClient {
  static final SqlClient instance = SqlClient._init();

  SqlClient._init();

  static Database? _database;

  Future<Database>? get database async{

    if(_database != null) return _database!;

    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async{
    String path = join(await getDatabasesPath(), 'CartDatabase.db');
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<void> _createDB(Database database, int version) async {
    await database.execute('''  
    CREATE TABLE $tableCart (
    $columnId $idType,
    $columnName $textType,
    $columnImage $textType,
    $columnPrice $textType,
    $columnQuantity $intType
    )
    ''');
  }


  /// CRUD

  // Create
  Future<void> createItem(CartModel cartModel) async {
    final db = await instance.database;

    try{
      db!.insert(
        tableCart,
        cartModel.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      print("Sql insert");
    } catch (e) {
      print("Sql error");
    }
  }

  // Update
  Future<void> updateItem(CartModel cartModel) async {
    final db = await instance.database;

    db!.update(
      tableCart,
      cartModel.toMap(),
      where: '$columnName = ?', //update with name not id
      whereArgs: [cartModel.name],
    );
  }

  // Delete
  Future<void> deleteItem(String? id) async {
    final db = await instance.database;

    db!.delete(
      tableCart,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }

  // Delete
  Future<void> deleteAllItem() async {
    final db = await instance.database;

    db!.delete(
      tableCart,
    );
  }

  // Read One Element
  Future<CartModel> readOneElement(String? id) async {
    final db = await instance.database;

    final data = await db!.query(
      tableCart,
      where: '$columnId = ?',
      whereArgs: [id],
    );

    return data.isNotEmpty
        ? CartModel.fromMap(data.first)
        : throw Exception('There is no data');
  }


  // Read All Elements
  Future<List<CartModel>> readAllElements() async {
    final db = await instance.database;

    final data = await db!.query(tableCart);

    return data.isNotEmpty
        ? data.map((item) => CartModel.fromMap(item)).toList()
        : [];
  }
}