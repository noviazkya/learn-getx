import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'package:belajar_getx/app/routes/app_pages.dart';

import '../../../providers/api.dart';
import '../../../data/collection_model.dart';

class CollectionController extends GetxController {
  var collectionList = <Collection>[].obs;
  var selectedDate = ''.obs;

  final titleController = TextEditingController();
  final creatorController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  void onInit() {
    fetchCollections();
    super.onInit();
  }

  Future<void> fetchCollections() async {
    try {
      var apiUrl = '${Api.baseUrl}/collections';
      var headers = await Api.getHeaders();

      var response = await http.get(
        Uri.parse(apiUrl),
        headers: headers,
      );

      if (response.statusCode == 200) {
        Iterable jsonResponse = json.decode(response.body);
        collectionList
            .assignAll(jsonResponse.map((model) => Collection.fromJson(model)));
      } else {
        throw Exception('Gagal mengambil koleksi');
      }
    } catch (e) {
      print('Error saat mengambil koleksi: $e');
    }
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      final formattedDate = DateFormat('yyyy-MM-dd').format(picked);
      selectedDate.value = formattedDate;
    }
  }

  void createCollection(
      String title, String creator, String description, String filePath) async {
    try {
      var apiUrl =
          '${Api.baseUrl}/collections/create'; // Ganti dengan URL endpoint Anda
      var headers = {
        'Content-Type':
            'multipart/form-data', // Gunakan tipe konten multipart/form-data
      };

      Map<String, dynamic> payload = {
        'title': title,
        'creator': creator,
        'description': description,
        'date': selectedDate.value,
        'inputFile': await _imageToBase64(filePath),
      };

      var response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
        body: json.encode(payload),
      );

      if (response.statusCode == 200) {
        print('Koleksi berhasil dibuat.');
        // Lakukan tindakan sesuai kebutuhan jika permintaan berhasil
      } else {
        print('Gagal membuat koleksi. Status code: ${response.statusCode}');
        // Lakukan tindakan sesuai kebutuhan jika permintaan gagal
      }
    } catch (e) {
      print('Error saat membuat koleksi: $e');
    }
  }

  Future<void> deleteCollection(String collectionId) async {
    try {
      var apiUrl =
          '${Api.baseUrl}/collections/delete/$collectionId'; // Tambahkan collectionId ke URL
      var headers = await Api.getHeaders();

      var response = await http.delete(
        Uri.parse(apiUrl),
        headers: headers,
      );
      
      if (response.statusCode == 200) {
        Get.snackbar('Success', 'collection successfully deleted');
        fetchCollections(); // Refresh the collectionList
        Get.offAndToNamed(Routes.COLLECTION); // Adjust the route accordingly
      } else {
        // Handle different HTTP status codes or server response here
        print('Failed to delete collection. Server response: ${response.body}');
        // You might want to display an appropriate error message to the user.
      }
    } catch (e) {
      print('Error during delete collection: $e');
      // Handle any other exceptions that might occur
    }
  }

  void pickFile() async {
    try {
      if (Platform.isAndroid || Platform.isIOS || Platform.isWindows) {
        FilePickerResult? result = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowMultiple: false,
          allowedExtensions: ['png', 'jpg', 'jpeg'],
        );

        if (result != null) {
          PlatformFile file = result.files.first;
          var inputFile;
          createCollection(titleController.text, creatorController.text,
              descriptionController.text, inputFile.file);
        } else {
          print('User membatalkan pemilihan.');
        }
      } else {
        print('Platform tidak mendukung operasi memilih file.');
      }
    } catch (e) {
      print('Error saat memilih file: $e');
    }
  }

  Future<String> _imageToBase64(String imagePath) async {
    File imageFile = File(imagePath);
    List<int> imageBytes = await imageFile.readAsBytes();
    String base64Image = base64Encode(imageBytes);
    return base64Image;
  }
}
