import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:optovka/app/model/facult.dart';
import 'package:optovka/app/routes/app_pages.dart';
import 'package:optovka/app/widgets/facult_item.dart';

import '../../../widgets/base_title.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BaseTitle('Факультативы'),
        centerTitle: false,
        actions: [
          GestureDetector(
            onTap: () => Get.toNamed(Routes.STUDENTS),
            child: const Icon(Icons.person).paddingOnly(
              right: 16,
            ),
          ),
        ],
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : Stack(
                children: [
                  GridView.builder(
                    primary: false,
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(
                        bottom: 8, left: 8, right: 8, top: 16),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 6,
                      crossAxisCount: 2,
                      mainAxisExtent: 180,
                    ),
                    itemCount: controller.list.length,
                    itemBuilder: (context, i) {
                      return Obx(
                        () => GestureDetector(
                          onTap: () => Get.toNamed(
                            Routes.DETAIL_FACULT,
                            arguments: controller.list[i],
                          ),
                          child: FacultItem(item: controller.list[i]),
                        ),
                      );
                    },
                  ),
                ],
              ),
      ),
    );
  }
}
