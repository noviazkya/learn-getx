import 'package:flutter/material.dart';
import 'package:belajar_getx/app/data/collection_model.dart';

class CollectionShowView extends StatelessWidget {
  final Collection collection;

  const CollectionShowView({Key? key, required this.collection})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Collection Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Title: ${collection.title}'),
            Text('Creator: ${collection.creator}'),
            Text('Date: ${collection.date}'),
            Text('Description: ${collection.description}'),
            Image.network(collection.url!),
          ],
        ),
      ),
    );
  }
}  