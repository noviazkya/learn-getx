import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/collection_controller.dart';

class CollectionCreateView extends GetView<CollectionController> {
  CollectionCreateView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Collection'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: controller.titleController,
              decoration: InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: controller.creatorController,
              decoration: InputDecoration(
                labelText: 'Creator',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: controller.descriptionController,
              decoration: InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            InkWell(
              onTap: () => controller.selectDate(context),
              child: InputDecorator(
                decoration: InputDecoration(
                  labelText: '',
                  hintText: 'Pilih tanggal',
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Date'),
                    Obx(() => Text(controller.selectedDate.value)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                controller.pickFile();
              },
              child: Text('Pilih Gambar'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                controller.createCollection(
                  controller.titleController.text,
                  controller.creatorController.text,
                  controller.descriptionController.text,
                  '',
                );
              },
              child: Text('Create'),
            ),
          ],
        ),
      ),
    );
  }
}
 