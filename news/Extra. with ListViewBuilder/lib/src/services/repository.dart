import 'package:news/src/resources/news_api_provider.dart';
import 'package:news/src/resources/news_db_provider.dart';
import '../models/item_model.dart';

class Repository {
  List<Source> sources = <Source>[newsDb_Provider, NEWSAPIProvider()];
  List<Cache> caches = <Cache>[newsDb_Provider];

  Future<List<int>> fetchTopIds() {
    return sources[1].fetchTopIds();
  }

  Future<ItemModel> fetchItem(id) async {
    ItemModel item;
    Source source;

    for (source in sources) {
      item = await source.fetchItem(id);
      if (item != null) break;
    }

    for (var cache in caches) {
      cache.addItems(item);
    }
    return item;
  }

/*
  Future<ItemModel> fetchItem(id) async {
    ItemModel item = await newsDbProvider.fetchItems(id);
    if (item != null) return item;
    item = await newsapiProvider.fetchItem(id);
    newsDbProvider.addItems(item);
    return item;
  }
  */
}

abstract class Source {
  Future<List<int>> fetchTopIds();
  Future<ItemModel> fetchItem(int id);
}

abstract class Cache {
  Future<int> addItems(ItemModel itemModel);
}
