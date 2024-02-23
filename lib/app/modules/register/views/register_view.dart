import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RegisterView'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '𝙍𝙚𝙜𝙞𝙨𝙩𝙚𝙧',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
                        _buildUsernameTextField(),
                        SizedBox(height: 16),
                        _buildEmailTextField(),
                        SizedBox(height: 16),
                        _buildPasswordTextField(),
                        SizedBox(height: 16),
                        _buildConfirmPasswordTextField(),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            if (controller.formKey.currentState!.validate()) {
                              controller.register();
                            }
                          },
                          child: Text('𝘾𝙧𝙚𝙖𝙩𝙚'),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  GestureDetector(
                    onTap: () {
                      controller.goToLogin();
                    },
                    child: Text(
                      '𝘼𝙡𝙧𝙚𝙖𝙙𝙮 𝙝𝙖𝙫𝙚 𝙖𝙣 𝙖𝙘𝙘𝙤𝙪𝙣𝙩 ? 𝙇𝙤𝙜𝙞𝙣 𝙝𝙚𝙧𝙚',
                      style: TextStyle(
                        color: Colors.blue,
                        // decoration: TextDecoration.underline,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUsernameTextField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: '𝙐𝙨𝙚𝙧𝙣𝙖𝙢𝙚',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      onChanged: controller.onUsernameChanged,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your username';
        }
        return null;
      },
    );
  }

  Widget _buildEmailTextField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: '𝙀𝙢𝙖𝙞𝙡',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      onChanged: controller.onEmailChanged,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email';
        }
        return null;
      },
    );
  }

  Widget _buildPasswordTextField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: '𝙋𝙖𝙨𝙨𝙬𝙤𝙧𝙙',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      obscureText: true,
      onChanged: controller.onPasswordChanged,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password';
        }
        return null;
      },
    );
  }

  Widget _buildConfirmPasswordTextField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: '𝘾𝙤𝙣𝙛𝙞𝙧𝙢 𝙋𝙖𝙨𝙨𝙬𝙤𝙧𝙙',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      obscureText: true,
      onChanged: controller.onConfPasswordChanged,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please confirm your password';
        } else if (value != controller.password.value) {
          return 'Passwords do not match';
        }
        return null;
      },
    );
  }
}
