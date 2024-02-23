import 'package:belajar_getx/app/modules/collection/views/collection_create.dart';
import 'package:belajar_getx/app/modules/collection/views/collection_show.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/collection_controller.dart';
import 'package:belajar_getx/app/data/collection_model.dart';

class CollectionView extends GetView<CollectionController> {
  CollectionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CollectionView'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Get.to(() => CollectionCreateView());
            },
          ),
        ],
      ),
      body: Obx(() {
        if (controller.collectionList.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
            itemCount: controller.collectionList.length,
            itemBuilder: (context, index) {
              Collection collection = controller.collectionList[index];
              return ListTile(
                title: Text(
                  collection.title ?? '',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Creator: ${collection.creator ?? ''}',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(collection.description ?? ''),
                  ],
                ),
                leading: SizedBox(
                  width: 50,
                  height: 50,
                  child: Image.network(collection.url ?? ''),
                ),
                trailing: Wrap(
                  spacing: 12, // Adjust the spacing as needed
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        // Tambahkan logika untuk edit
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.remove_circle),
                      onPressed: () async {
                        // Tampilkan dialog konfirmasi sebelum delete
                        await Get.defaultDialog(
                          title: 'Konfirmasi',
                          middleText:
                              'Apakah anda yakin ingin menghapus kategori "${collection.title} - ${collection.uuid}"?',
                          textConfirm: 'Ya, hapus',
                          textCancel: 'Batal',
                          confirmTextColor: Colors.white,
                          onConfirm: () async {
                            await controller.deleteCollection(collection.uuid!);
                            // Menggunakan toString() untuk mengonversi UUID menjadi string
                          },
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.visibility),
                      onPressed: () {
                        Get.to(
                            () => CollectionShowView(collection: collection));
                      },
                    ),
                  ],
                ),
                onTap: () {
                  Get.to(() => CollectionShowView(collection: collection));
                },
              );
            },
          );
        }
      }),
    );
  }
}
