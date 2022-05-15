// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/common/widgets/text_field_background_container.dart';
import 'package:weather_app/common/theme_color.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final TextEditingController controller;
  final int maxLines = 1;
  final int maxLength = 100;
  // final Function validator;
  // final Function onSaved;
  // final List<TextInputFormatter>? formatter;
  const TextFieldWidget({
    Key? key,
    required this.hintText,
    this.icon = Icons.person,
    required this.onChanged,
    required this.controller,
    // required this.validator,
    // required this.onSaved,
    // required this.formatter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldBackgroundContainer(
      child: TextFormField(
        key: key,
        autofocus: false,
        controller: controller,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: AppColor.kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
        // maxLength: maxLength,
        // onSaved: onSaved(),
        // inputFormatters: formatter,
        // maxLines: maxLines,
        // validator: validator(),
      ),
      // TextField(
      //   onChanged: onChanged,
      //   cursorColor: AppColor.kPrimaryColor,
      //   controller: controller,
      //   decoration: InputDecoration(
      //     icon: Icon(
      //       icon,
      //       color: AppColor.kPrimaryColor,
      //     ),
      //     hintText: hintText,
      //     border: InputBorder.none,
      //   ),
      // ),
    );
  }
}
