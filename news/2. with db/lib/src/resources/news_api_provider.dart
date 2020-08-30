import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../models/item_model.dart';

class NEWSAPIProvider {
  String _root = "https://hacker-news.firebaseio.com/v0";
  Client client = new Client();

  Future<List<int>> fetchTopIds() async {
    String url = "$_root/topstories.json";
    dynamic response = await client.get(url);
    dynamic ids = json.decode(response.body);
    return ids.cast<int>();
  }

  Future<ItemModel> fetchItem(int id) async {
    String url = "$_root/item/$id.json";
    dynamic response = await client.get(url);
    dynamic parsedJson = json.decode(response.body);

    return ItemModel.fromJson(parsedJson);
  }
}
