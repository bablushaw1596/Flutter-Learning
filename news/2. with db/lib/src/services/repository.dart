import 'package:news/src/resources/news_api_provider.dart';
import 'package:news/src/resources/news_db_provider.dart';
import '../models/item_model.dart';

class Repository {
  NewsDbProvider newsDbProvider = new NewsDbProvider();
  NEWSAPIProvider newsapiProvider = new NEWSAPIProvider();

  Future<List<int>> fetchTopIds() {
    return newsapiProvider.fetchTopIds();
  }

  Future<ItemModel> fetchItem(id) async {
    ItemModel item = await newsDbProvider.fetchItems(id);
    if (item != null) return item;
    item = await newsapiProvider.fetchItem(id);
    newsDbProvider.addItems(item);
    return item;
  }
}
