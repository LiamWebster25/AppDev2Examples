import 'package:flutter/material.dart';
import 'photo_model.dart';
import 'ApiService.dart';

class Page1 extends StatefulWidget {
  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  late List<PhotoModel>? _photoModel = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _photoModel = (await ApiService().getPhotos());
    Future.delayed(Duration(seconds: 2)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('REST example 2'),
        ),
        body: _photoModel == null || _photoModel!.isEmpty
            ? Center(
          child: CircularProgressIndicator(),
        )
            : ListView.builder(
          itemCount: _photoModel!.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 5,
              margin: EdgeInsets.all(10),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child:
                    ClipOval(
                      child: Image.network("${_photoModel![index].thumbnailUrl}",
                        width: 50,
                        height: 50, // Adjust this property based on your needs
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    width: 190,
                    child:
                    Column(
                      children: [
                        Text('${_photoModel![index].title}'),
                        Text('${_photoModel![index].id}'),
                        Text('${_photoModel![index].albumId}'),

                      ],
                    ),
                  ),
                  Spacer(),
                  Image.network("${_photoModel![index].url}",
                    width: 100,
                    height: 100, // Adjust this property based on your needs
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}