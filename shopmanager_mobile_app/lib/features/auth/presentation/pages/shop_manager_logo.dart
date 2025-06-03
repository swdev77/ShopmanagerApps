import 'package:flutter/material.dart';
import 'package:shopmanager_mobile_app/core/assets/app_logos.dart';

class ShopManagerLogo extends StatelessWidget {
  final double? height;
  final double? width;
  const ShopManagerLogo({
    super.key,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppLogos.sm,
      height: height ?? 160,
      width: width ?? 160,
    );
  }
}
