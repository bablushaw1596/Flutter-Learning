class ImageModel {
  int id;
  String title;
  String url;

  ImageModel.fromJSON(Map<String, dynamic> parsedJSON) {
    this.id = parsedJSON['id'];
    this.title = parsedJSON['title'];
    this.url = parsedJSON['url'];
  }

  ImageModel(this.id, this.title, this.url);
}
