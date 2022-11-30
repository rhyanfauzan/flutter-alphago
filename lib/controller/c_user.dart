import 'package:get/get.dart';

import '../model/user.dart';

String? newEmail;

class CUser extends GetxController {
  final _data = UserModel().obs;
  UserModel get data => _data.value;
  setData(n) => _data.value = n;
}

