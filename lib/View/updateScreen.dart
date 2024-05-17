import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../src/Controller/userController.dart';
import '../src/Model/user.dart';

class UpdateScreen extends StatelessWidget {
  final UserController todoController = Get.find();
  final  User user;

  UpdateScreen({required this.user});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    nameController.text = user.name!;
    descriptionController.text = user.description!;

    return Scaffold(
      appBar: AppBar(
        title: Text('Update Todo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'name'),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                user.name = nameController.text;
                user.description = descriptionController.text;
                todoController.updateUser(user);
                Get.back();
              },
              child: Text('Update'),
            )
          ],
        ),
      ),
    );
  }
}
