import 'package:sqflite/sqflite.dart';
import 'dart:io'; //  for file io support
import 'package:path_provider/path_provider.dart'; // for underlying path
import 'package:path/path.dart'; // for underlying path
import 'dart:async'; // for async, coz file and db are async
import '../models/item_model.dart';

class NewsDbProvider {
  Database db;

  void init() async {
    Directory documentsDirectory =
        await getApplicationDocumentsDirectory(); // It will create a temporary dir accessable only by this app,
    final path = join(documentsDirectory.path, "items.db");
    db = await openDatabase(path,
        version:
            1, // version u know will update by 1 for new settings, path tells where to create db
        onCreate: (Database newDb, int version) {
      // a new temporary conn to newDb. will be re-assign to db when done
      newDb.execute("""
            CREATE TABLE Items(
              id INTEGER PRIMARY KEY,
              deleted INTEGER,
              type TEXT,
              by TEXT,
              time INTEGER,
              text TEXT,
              dead TEXT,
              parent INTEGER,
              kids BLOB,
              url TEXT,
              score INTEGER,
              title TEXT,
              descendants INTEGER
            )
           """);
    });
  }

  Future<ItemModel> fetchItems(id) async {
    final maps = await db.query(
      "Items",
      columns:
          null, // null= returns all columns, else fill clm name in [] like [title, dead]
      where: "id=?",
      whereArgs: [id],
    );
    if (maps.length > 0) {
      return ItemModel.fromDb(maps.first);
    }
    return null;
  }

  Future<int> addItems(ItemModel itemModel) {
    return db.insert("Items", itemModel.mapforDb());
  }
}
