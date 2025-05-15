import 'package:hive/hive.dart';
import '../models/user_model.dart';

class UserDao {
  static Box<UserModel> get _box => Hive.box<UserModel>('users');

  static Future<void> insertUser(UserModel user) async {
    await _box.put(user.email, user);
  }

  static UserModel? getUserByEmail(String email) {
    return _box.get(email);
  }
}
