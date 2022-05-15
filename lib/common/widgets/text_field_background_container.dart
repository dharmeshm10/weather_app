import 'package:flutter/material.dart';
import 'package:weather_app/common/layout_constants.dart';
import 'package:weather_app/common/theme_color.dart';

class TextFieldBackgroundContainer extends StatelessWidget {
  final Widget child;
  const TextFieldBackgroundContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: LayoutConstants.dimen_10),
      padding: const EdgeInsets.symmetric(
        horizontal: LayoutConstants.dimen_20,
        vertical: LayoutConstants.dimen_5,
      ),
      width: size.width * LayoutConstants.dimen_0_8,
      decoration: BoxDecoration(
        color: AppColor.kPrimaryLightColor,
        borderRadius: BorderRadius.circular(LayoutConstants.dimen_29),
      ),
      child: child,
    );
  }
}
