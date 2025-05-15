import 'package:theme_responsive_widget/data/user_dao.dart';
import 'package:theme_responsive_widget/models/user_model.dart';

class AppInitData {
  static Future<void> initialize() async {
    await _createDefaultUser();
  }

  static Future<void> _createDefaultUser() async {
    const defaultEmail = 'teste@email.com';
    const defaultPassword = '123456';

    final existingUser = await UserDao.getUserByEmail(defaultEmail);
    if (existingUser == null) {
      final user = UserModel(email: defaultEmail, password: defaultPassword);
      await UserDao.insertUser(user);
    }
  }
}
