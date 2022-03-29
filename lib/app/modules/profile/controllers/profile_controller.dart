import 'package:get/get.dart';
import 'package:optovka/app/controllers/sqllite_controller.dart';
import 'package:optovka/app/model/client.dart';

class ProfileController extends GetxController {
  ProfileController({required this.sqlLiteController});
  final SqlLiteController sqlLiteController;

  final RxList<Client> list = RxList();
  RxBool isLoading = RxBool(false);

  Future<void> getUsers() async {
    try {
      isLoading.value = true;
      list.value = await sqlLiteController.getUsers();
      await Future.delayed(Duration(milliseconds: 500));
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  @override
  Future<void> onInit() async {
    await getUsers();
    super.onInit();
  }
}
