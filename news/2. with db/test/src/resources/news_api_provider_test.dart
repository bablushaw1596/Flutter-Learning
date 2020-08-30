import 'package:flutter_test/flutter_test.dart';
import 'package:news/src/resources/news_api_provider.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/testing.dart';

void main() {
  test('Fetch topresults and returns a list of ids', () async {
    final newsApiProvider = NEWSAPIProvider();
    newsApiProvider.client = MockClient((request) async {
      return Response(json.encode([1, 2, 3, 4]), 200);
    });
    final ids = await newsApiProvider.fetchTopIds();
    expect(ids, [1, 2, 3, 4]);
  });

  test('Fetch item instance using id', () async {
    NEWSAPIProvider newsapi = NEWSAPIProvider();
    newsapi.client = MockClient((request) async {
      Map response = {'id': 2};
      return Response(json.encode(response), 200);
    });
    final itemModel = await newsapi.fetchItem(1);

    expect(itemModel.id, 2);
  });
}
