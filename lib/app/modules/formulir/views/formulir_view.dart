import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/formulir_controller.dart';

class FormulirView extends StatelessWidget {
  FormulirView({Key? key}) : super(key: key);

  final FormulirController formulirController = FormulirController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FormulirView'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Nama'),
                      onChanged: (value) =>
                          formulirController.nama.value = value,
                    ),
                    SizedBox(height: 16.0),
                    InkWell(
                      onTap: () => formulirController.selectDate(context),
                      child: InputDecorator(
                        decoration: InputDecoration(
                          labelText: 'Tanggal Lahir',
                          hintText: 'Pilih tanggal',
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Tanggal Lahir:'),
                            Obx(() =>
                                Text(formulirController.selectedDate.value)),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    DropdownButtonFormField(
                      items: ['Islam', 'Kristen', 'Hindu', 'Buddha', 'Lainnya']
                          .map((agama) => DropdownMenuItem(
                              value: agama, child: Text(agama)))
                          .toList(),
                      onChanged: (value) =>
                          formulirController.agama.value = value.toString(),
                      decoration: InputDecoration(labelText: 'Agama'),
                    ),
                    SizedBox(height: 16.0),
                    Row(
                      children: [
                        Obx(() => Radio(
                              value: 'Laki-laki',
                              groupValue: formulirController.jenisKelamin.value,
                              onChanged: (value) => formulirController
                                  .jenisKelamin.value = value!,
                            )),
                        Text('Laki-laki'),
                        Obx(() => Radio(
                              value: 'Perempuan',
                              groupValue: formulirController.jenisKelamin.value,
                              onChanged: (value) => formulirController
                                  .jenisKelamin.value = value!,
                            )),
                        Text('Perempuan'),
                      ],
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      maxLines: 3,
                      decoration: InputDecoration(labelText: 'Alamat'),
                      onChanged: (value) =>
                          formulirController.alamat.value = value,
                    ),
                    SizedBox(height: 16.0),
                    for (String hobi in formulirController.getHobiList())
                      Obx(() => CheckboxListTile(
                            title: Text(hobi),
                            value: formulirController.hobi.contains(hobi),
                            onChanged: (value) =>
                                formulirController.toggleHobi(hobi),
                          )),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () => formulirController.submitForm(),
                      child: Text('Submit'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              Obx(() {
                if (formulirController.isFormSubmitted.value) {
                  return AlertDialog(
                    title: Text('Output'),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Nama: ${formulirController.nama.value}'),
                        Text(
                            'Tanggal Lahir: ${formulirController.tanggalLahir.value}'),
                        Text('Agama: ${formulirController.agama.value}'),
                        Text(
                            'Jenis Kelamin: ${formulirController.jenisKelamin.value}'),
                        Text('Alamat: ${formulirController.alamat.value}'),
                        Text(
                            'Hobi: ${formulirController.hobi.value.join(', ')}'),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Get.back(); // Menutup dialog setelah dikonfirmasi
                          formulirController.isFormSubmitted.value = true;
                        },
                        child: Text('OK'),
                      ),
                    ],
                  );
                } else {
                  return SizedBox.shrink();
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
