import 'package:flutter/material.dart';
import 'package:weather_app/common/layout_constants.dart';
import 'package:weather_app/common/theme_color.dart';

class PrimaryButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback press;
  final Color color, textColor;
  const PrimaryButtonWidget({
    Key? key,
    required this.text,
    required this.press,
    this.color = AppColor.kPrimaryColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: LayoutConstants.dimen_10),
      width: size.width * LayoutConstants.dimen_0_8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(LayoutConstants.dimen_29),
        child: ElevatedButton(
          child: Text(
            text,
            style: TextStyle(color: textColor),
          ),
          onPressed: () => press.call(),
          style: ElevatedButton.styleFrom(
              primary: color,
              padding: const EdgeInsets.symmetric(
                  horizontal: LayoutConstants.dimen_40,
                  vertical: LayoutConstants.dimen_20),
              textStyle: TextStyle(
                color: textColor,
                fontSize: LayoutConstants.dimen_14,
                fontWeight: FontWeight.w500,
              )),
        ),
      ),
    );
  }
}
