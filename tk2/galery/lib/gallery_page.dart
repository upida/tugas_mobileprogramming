import 'package:flutter/material.dart';

final List<Map<String, dynamic>> _listItem = [
  {"image": 'assets/images/picture-1.jpg'},
  {"image": 'assets/images/picture-2.jpg'},
  {"image": 'assets/images/picture-3.jpg'},
];

class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(Icons.menu),
        title: Text("Gallery"),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0)
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: GridView.count(
            crossAxisCount: 1,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: _listItem.map((item) => Card(
              color: Colors.transparent,
              elevation: 0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage(item["image"]),
                    fit: BoxFit.cover
                  )
                ),
              ),
            )).toList(),
          )
        ),
      ),
    );
  }
}
