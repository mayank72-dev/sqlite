import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


import '../src/Controller/userController.dart';
import '../src/Model/user.dart';

class Addscreen extends StatelessWidget {
   Addscreen({Key? key}) : super(key: key);
  final UserController userController = Get.find();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Todo'),
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
                final todo =  User(
                  name: nameController.text,
                  description: descriptionController.text,
                );
                userController.addUser(todo);
                Get.back();
              },
              child: Text('Add'),
            )
          ],
        ),
      ),
    );
  }
}
