import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImagePlaceHolderWidget extends StatelessWidget {
  const ImagePlaceHolderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.image,
      color: Theme.of(context).dividerColor,
      size: 32,
    );
  }
}
