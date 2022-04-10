import 'package:facult/app/widgets/base_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../controllers/new_facult_controller.dart';

class NewFacultView extends GetView<NewFacultController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BaseTitle('Новый факультет'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              SizedBox(height: 12),
              Text(
                'Информация о факультативе',
                style: Get.textTheme.headline1,
              ),
              SizedBox(height: 6),
              TextFormField(
                controller: controller.name,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                      RegExp('[a-zA-Zdasа-яА-Я_ ]')),
                ],
                decoration: InputDecoration(
                  labelText: 'Название практики',
                ),
              ),
              SizedBox(height: 6),
              TextFormField(
                controller: controller.description,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                      RegExp('[a-zA-Zdasа-яА-Я_ ]')),
                ],
                decoration: InputDecoration(
                  labelText: 'Описание практики',
                ),
              ),
              SizedBox(height: 6),
              TextFormField(
                controller: controller.lecti,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                ],
                decoration: InputDecoration(
                  labelText: 'Часы лекций',
                ),
              ),
              SizedBox(height: 6),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: controller.practic,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                      ],
                      decoration: InputDecoration(
                        labelText: 'Часы практик',
                      ),
                    ),
                  ),
                  SizedBox(width: 4),
                  Expanded(
                    child: TextFormField(
                      controller: controller.lab,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                      ],
                      decoration: InputDecoration(
                        labelText: 'Часы лабораторных',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              SizedBox(
                height: 40,
                child: ElevatedButton(
                  onPressed: () => controller.addNewFacult(),
                  child: Text(
                    'Добавить',
                    style: Get.textTheme.bodyText2,
                  ),
                ),
              )
            ],
          ),
        ],
      ).paddingAll(16),
    );
  }
}
