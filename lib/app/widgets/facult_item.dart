import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/facult.dart';

class FacultItem extends StatelessWidget {
  const FacultItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Facult? item;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Get.theme.cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item?.name ?? '',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Get.textTheme.headline2,
          ),
          SizedBox(height: 4),
          Text(
            item?.description ?? '',
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: Get.textTheme.bodyText2,
          ),
          SizedBox(height: 8),
          Text(
            '- Лекции: ${item?.lekci} часов',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Get.textTheme.caption,
          ),
          Text(
            '- Лабы: ${item?.laboratory} часов',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Get.textTheme.caption,
          ),
          Text(
            '- Практики: ${item?.practic} часов',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Get.textTheme.caption,
          ),
        ],
      ).paddingAll(8),
    );
  }
}
