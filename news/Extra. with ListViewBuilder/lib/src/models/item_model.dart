import 'dart:convert';

class ItemModel {
  final int id;
  final bool deleted;
  final String type;
  final String by;
  final int time;
  final String text;
  final bool dead;
  final int parent;
//  final poll
  final List<dynamic> kids;
  final String url;
  final int score;
  final String title;
//  final   parts
  final int descendants;

  ItemModel.fromJson(Map<String, dynamic> parsedJson)
      : id = parsedJson['id'],
        deleted = parsedJson['deleted'] == 1,
        type = parsedJson['type'],
        by = parsedJson['by'],
        time = parsedJson['time'],
        text = parsedJson['text'],
        dead = parsedJson['dead'] == 1,
        parent = parsedJson['parent'],
        kids = parsedJson['kids'],
        url = jsonDecode(parsedJson['url']),
        score = parsedJson['score'],
        title = parsedJson['title'],
        descendants = parsedJson['descendants'];

  ItemModel.fromDb(Map<String, dynamic> parsedDb)
      : id = parsedDb['id'],
        deleted = parsedDb['deleted'],
        type = parsedDb['type'],
        by = parsedDb['by'],
        time = parsedDb['time'],
        text = parsedDb['text'],
        dead = parsedDb['dead'],
        parent = parsedDb['parent'],
        kids = parsedDb['kids'],
        url = parsedDb['url'],
        score = parsedDb['score'],
        title = parsedDb['title'],
        descendants = parsedDb['descendants'];

  Map<String, dynamic> mapforDb() {
    return <String, dynamic>{
      "id": id,
      "deleted": deleted ? 1 : 0,
      "type": type,
      "by": by,
      "time": time,
      "text": text,
      "dead": dead ? 1 : 0,
      "parent": parent,
      "kids": jsonEncode(kids),
      "url": url,
      "score": score,
      "title": title,
      "descendants": descendants
    };
  }
}
