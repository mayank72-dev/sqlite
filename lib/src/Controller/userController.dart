import 'package:get/get.dart';
import '../Database/database.dart';
import '../Model/user.dart';


class UserController extends GetxController {
  var userList = <User>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchUser();
  }

  void fetchUser() async {
    var todos = await DatabaseHelper().queryAll();
    userList.assignAll(todos.map((e) => User.fromMap(e)).toList());
  }

  void addUser(User todo) async {
    await DatabaseHelper().insert(todo.toMap());
    fetchUser();
  }

  void updateUser(User user) async {
    await DatabaseHelper().update(user.toMap());
    fetchUser();
  }
    void deleteUser(int id)async{
      await DatabaseHelper().delete(id);
      fetchUser();


  }
}
