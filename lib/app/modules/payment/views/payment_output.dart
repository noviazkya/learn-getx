import 'package:belajar_getx/app/modules/payment/controllers/payment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentOutput extends StatelessWidget {
  final Map<String, dynamic> dataFormulir;
  final PaymentController paymentController = Get.put(PaymentController());

  PaymentOutput({Key? key, required this.dataFormulir}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Output Payment'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: GetBuilder<PaymentController>(
          builder: (controller) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '𝙄𝙣𝙛𝙤𝙧𝙢𝙖𝙨𝙞 𝘿𝙖𝙩𝙖 𝘿𝙞𝙧𝙞 :',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                Text('𝙉𝙖𝙢𝙖 : ${dataFormulir['namaLengkap']}'),
                Text(
                    '𝙏𝙚𝙢𝙥𝙖𝙩 & 𝙏𝙖𝙣𝙜𝙜𝙖𝙡 𝙇𝙖𝙝𝙞𝙧 : ${dataFormulir['tempatLahir']}, ${dataFormulir['selectedDate']}'),
                Text('𝙐𝙢𝙪𝙧 : ${dataFormulir['umur']} tahun'),
                Text(
                    '𝙅𝙚𝙣𝙞𝙨 𝙆𝙚𝙡𝙖𝙢𝙞𝙣 : ${dataFormulir['jenisKelamin']}'),
                Text('𝙀𝙢𝙖𝙞𝙡 : ${dataFormulir['email']}'),
                Text('𝙏𝙞𝙥𝙚 𝙈𝙚𝙢𝙗𝙚𝙧 : ${dataFormulir['member']}'),
                SizedBox(height: 16.0),
                Text(
                  '𝘿𝙚𝙩𝙖𝙞𝙡 𝙋𝙚𝙢𝙗𝙖𝙮𝙖𝙧𝙖𝙣 :',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                                Text(
                    '𝙀𝙭𝙥𝙞𝙧𝙚-𝙙𝙖𝙩𝙚 : ${dataFormulir['expired-date']}'),
                Text(
                    '𝙏𝙤𝙩𝙖𝙡 𝙋𝙚𝙢𝙗𝙖𝙮𝙖𝙧𝙖𝙣 : Rp ${dataFormulir['totalPembayaran']}'),
                Text('𝘿𝙚𝙨𝙠𝙧𝙞𝙥𝙨𝙞 : ${dataFormulir['deskripsi']}'),
              ],
            );
          },
        ),
      ),
    );
  }
}
