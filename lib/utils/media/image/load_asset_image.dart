import 'package:flutter/material.dart';

class LoadAssetImage extends StatelessWidget {
  const LoadAssetImage({
    Key? key,
    this.image,
    this.width,
    this.height,
    this.fit,
    this.format = '',
    this.gaplessPlayback = false,
    this.color,
  }) : super(key: key);

  final String? image;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final String format;
  final bool gaplessPlayback;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    if (image?.isNotEmpty == true) {
      return Image.asset(
        image!,
        height: height,
        width: width,
        fit: fit,
        gaplessPlayback: gaplessPlayback,
        color: color,
      );
    } else {
      return Container(
        height: height,
        width: width,
        color: color,
      );
    }
  }
}
