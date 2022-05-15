import 'package:flutter/material.dart';
import 'package:weather_app/common/layout_constants.dart';
import 'package:weather_app/common/theme_color.dart';
import 'package:weather_app/common/widgets/widget_constants.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: size.height * LayoutConstants.dimen_0_0_2),
      width: size.width * LayoutConstants.dimen_0_8,
      child: Row(
        children: <Widget>[
          buildDivider,
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: LayoutConstants.dimen_10),
            child: Text(
              WidgetConstants.or,
              style: TextStyle(
                color: AppColor.kPrimaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          buildDivider,
        ],
      ),
    );
  }

  Expanded get buildDivider {
    return const Expanded(
      child: Divider(
        color: AppColor.dividerColor,
        height: LayoutConstants.dimen_1_5,
      ),
    );
  }
}
