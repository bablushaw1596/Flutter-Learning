import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'package:new_app/src/model/image_model.dart';
import 'widgets/image_list.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  int counter = 0;
  List<ImageModel> images = [];
  void fetchImage() async {
    counter += 1;
    var response =
        await get('https://jsonplaceholder.typicode.com/photos/$counter');
    var parsedJson = json.decode(response.body);
    var imageModel = ImageModel.fromJSON(parsedJson);

    setState(() {
      images.add(imageModel);
    });
  }

  Widget build(context) {
    return MaterialApp(
        home: Scaffold(
      body: Center(
        child: ImageList(images),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          fetchImage();
        },
      ),
      appBar: AppBar(
        title: Text('Lets see some images'),
      ),
    ));
  }
}
