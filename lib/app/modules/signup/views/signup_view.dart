// ignore_for_file: use_super_parameters, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/signup_controller.dart';
// import 'my_button.dart';
// import 'my_textfield.dart';

class SignupView extends GetView<SignupController> {
  SignupView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
        child: Form(
          key: controller.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(children: [
            const Icon(
              Icons.lock,
              size: 100,
            ),
            const SizedBox(height: 25),
            // welcome back, you've been missed!
            Text(
              'Create an account',
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 25),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey.shade400),
                ),
                labelText: "Name",
                labelStyle: TextStyle(color: Colors.grey[500]),
                prefixIcon: const Icon(Icons.person),
                prefixIconColor: Colors.grey[500],
                fillColor: Colors.grey.shade200,
                filled: true,
              ),
              keyboardType: TextInputType.name,
              controller: controller.nameEditingController,
              validator: (value) {
                return controller.validateName(value!);
              },
            ),
            const SizedBox(height: 25),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey.shade400),
                ),
                labelText: "Email",
                labelStyle: TextStyle(color: Colors.grey[500]),
                prefixIcon: const Icon(Icons.email),
                prefixIconColor: Colors.grey[500],
                fillColor: Colors.grey.shade200,
                filled: true,
              ),
              keyboardType: TextInputType.emailAddress,
              controller: controller.emailEditingController,
              validator: (value) {
                return controller.validateEmail(value!);
              },
            ),
            const SizedBox(height: 25),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey.shade400),
                ),
                labelText: "Password",
                labelStyle: TextStyle(color: Colors.grey[500]),
                prefixIcon: const Icon(Icons.lock),
                prefixIconColor: Colors.grey[500],
                fillColor: Colors.grey.shade200,
                filled: true,
              ),
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              controller: controller.passwordEditingController,
              validator: (value) {
                return controller.validatePassword(value!);
              },
            ),
            const SizedBox(
              height: 25,
            ),
            ConstrainedBox(
              constraints: BoxConstraints.tightFor(width: context.width),
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(14)),
                ),
                child: const Text(
                  "Sign Up",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                onPressed: () {
                  controller.validateAndSignUp(
                      email: controller.emailEditingController.text,
                      password: controller.passwordEditingController.text,
                      name: controller.nameEditingController.text);
                },
              ),
            ),
            const SizedBox(height: 25),
            // not a member? register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Have a account?',
                  style: TextStyle(color: Colors.grey[700]),
                ),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: () {
                    controller.moveToLogin();
                  },
                  child: const Text(
                    'Login now',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
