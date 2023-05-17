import 'dart:io';
import 'package:flutter/material.dart';

class AddDoctor extends StatefulWidget {
  const AddDoctor({super.key});

  @override
  State<AddDoctor> createState() => _AddDoctorState();
}

class _AddDoctorState extends State<AddDoctor> {
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController educationController = TextEditingController();
  File? uploadedFile;

  void _submitForm() {
    // Add logic to handle the form submission
    String email = emailController.text;
    String username = usernameController.text;
    String password = passwordController.text;
    String education = educationController.text;

    // Use the uploadedFile variable to access the uploaded file

    // Add your logic here to process the form data
  }

  @override
  void dispose() {
    emailController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    educationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Doctor'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            TextField(
              controller: educationController,
              decoration: InputDecoration(
                labelText: 'Education',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Add logic to handle file upload
                // You can use plugins like file_picker or image_picker
                // to handle file selection from the device
              },
              child: Text('Upload PDF'),
            ),
            SizedBox(height: 16.0),
            if (uploadedFile != null)
              Text('Uploaded File: ${uploadedFile!.path}'),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _submitForm,
              child: Text('Add Doctor'),
            ),
          ],
        ),
      ),
    );
  }
}
