import 'package:get/get.dart';

enum UserRole { traveler, sender }

class RoleController extends GetxController {
  var selectedRole = Rxn<UserRole>();

  void selectRole(UserRole role) {
    selectedRole.value = role;
  }
}
