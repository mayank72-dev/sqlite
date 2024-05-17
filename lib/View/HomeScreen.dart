import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sqlitedatbase/View/updateScreen.dart';

import '../src/Controller/userController.dart';
import 'addscreen.dart';

class Homescreen extends StatelessWidget {
  final UserController userController = Get.put(UserController());
   Homescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text('User Data'),
        ),
        body: Obx(() {
          return ListView.builder(
            itemCount: userController.userList.length,
            itemBuilder: (context, index) {
              final user = userController.userList[index];
              return ListTile(
                  title: Text(  user.name!),
                  subtitle: Text(user.description!),
                  trailing: InkWell( onTap: (){userController.deleteUser(user.id!);}, child: Icon(Icons.delete),),
                  onTap: () => Get.to(UpdateScreen( user: user,)),
              );
            },
          );
        }),
        floatingActionButton: FloatingActionButton(
            onPressed: () => Get.to(Addscreen()),
    child: Icon(Icons.add),
    ),
    );
  }
}
