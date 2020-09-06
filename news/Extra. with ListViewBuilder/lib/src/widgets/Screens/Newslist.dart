import 'package:flutter/material.dart';

class NewsList extends StatelessWidget {
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top News'),
      ),
      body: buildList(),
    );
  }

  Widget buildList() {
    return ListView.builder(itemBuilder: (context, int index) {
      return FutureBuilder(
          future: getFuture(),
          builder: (context, snapshot) {
            return Container(
              height: 80.0,
              child: snapshot.hasData
                  ? Text('Visible $index')
                  : Text('Will appear $index'),
            );
          });
    });
  }

  Future getFuture() {
    return Future.delayed(Duration(seconds: 2), () => 'hi');
  }
}
