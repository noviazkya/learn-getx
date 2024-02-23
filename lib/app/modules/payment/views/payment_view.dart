import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/payment_controller.dart';

class PaymentView extends StatelessWidget {
  final PaymentController paymentController = PaymentController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Membership App'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: '𝙉𝙖𝙢𝙖 𝙇𝙚𝙣𝙜𝙠𝙖𝙥'),
                        onChanged: (value) =>
                            paymentController.namaLengkap.value = value,
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: '𝙏𝙚𝙢𝙥𝙖𝙩 𝙇𝙖𝙝𝙞𝙧'),
                        onChanged: (value) =>
                            paymentController.tempatLahir.value = value,
                      ),
                      SizedBox(height: 16.0),
                      InkWell(
                        onTap: () => paymentController.selectDate(context),
                        child: InputDecorator(
                          decoration: InputDecoration(
                            labelText: '𝙏𝙖𝙣𝙜𝙜𝙖𝙡 𝙇𝙖𝙝𝙞𝙧',
                            hintText: '𝘗𝘪𝘭𝘪𝘩 𝘛𝘢𝘯𝘨𝘨𝘢𝘭',
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Obx(() =>
                                  Text(paymentController.selectedDate.value)),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Text('𝙅𝙚𝙣𝙞𝙨 𝙆𝙚𝙡𝙖𝙢𝙞𝙣'),
                      Row(
                        children: [
                          Obx(() => Radio(
                                value: 'Laki-laki',
                                groupValue:
                                    paymentController.jenisKelamin.value,
                                onChanged: (value) => paymentController
                                    .jenisKelamin.value = value!,
                              )),
                          Text('Laki-laki'),
                          Obx(() => Radio(
                                value: 'Perempuan',
                                groupValue:
                                    paymentController.jenisKelamin.value,
                                onChanged: (value) => paymentController
                                    .jenisKelamin.value = value!,
                              )),
                          Text('Perempuan'),
                        ],
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        decoration: InputDecoration(labelText: '𝙀𝙢𝙖𝙞𝙡'),
                        onChanged: (value) =>
                            paymentController.email.value = value,
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        decoration: InputDecoration(labelText: '𝙉𝙚𝙜𝙖𝙧𝙖'),
                        onChanged: (value) =>
                            paymentController.negara.value = value,
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        decoration:
                            InputDecoration(labelText: '𝙉𝙤𝙢𝙤𝙧 𝙆𝙖𝙧𝙩𝙪'),
                        onChanged: (value) =>
                            paymentController.cardnumber.value = value,
                      ),  
                      SizedBox(height: 16.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text('𝙏𝙞𝙥𝙚 𝙈𝙚𝙢𝙗𝙚𝙧 :'),
                          for (String member
                              in paymentController.getTipeMemberList())
                            Obx(() => CheckboxListTile(
                                  title: Text(member),
                                  value:
                                      paymentController.member.contains(member),
                                  onChanged: (value) => paymentController
                                      .toggleMemberList(member),
                                )),
                          SizedBox(height: 16.0),
                        ],
                      ),
                      SizedBox(height: 16.0),
                      Obx(
                        () => Text(
                            '𝙋𝙚𝙢𝙗𝙖𝙮𝙖𝙧𝙖𝙣 : ${paymentController.totalPembayaran.value}'),
                      ),
                      Obx(
                        () => Text(
                            '𝘿𝙚𝙨𝙠𝙧𝙞𝙥𝙨𝙞 : ${paymentController.getDeskripsiMembership()}'),
                      ),
                      SizedBox(height: 16.0),
                      ElevatedButton(
                        onPressed: () => paymentController.submitForm(context),
                        child: Text('𝘚𝘶𝘣𝘮𝘪𝘵'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
