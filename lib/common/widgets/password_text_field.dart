import 'package:flutter/material.dart';
import 'package:weather_app/common/widgets/text_field_background_container.dart';
import 'package:weather_app/common/theme_color.dart';
import 'package:weather_app/common/widgets/widget_constants.dart';

class PasswordTextField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  const PasswordTextField({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  late ValueNotifier<bool> _valueNotifier;

  @override
  void initState() {
    super.initState();
    _valueNotifier = ValueNotifier(true);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _valueNotifier,
      builder: (BuildContext context, bool value, Widget? child) {
        return TextFieldBackgroundContainer(
          child: TextFormField(
            obscureText: _valueNotifier.value,
            onChanged: widget.onChanged,
            cursorColor: AppColor.kPrimaryColor,
            decoration: InputDecoration(
              hintText: WidgetConstants.hintTextPassword,
              icon: const Icon(
                Icons.lock,
                color: AppColor.kPrimaryColor,
              ),
              suffixIcon: InkWell(
                onTap: () {
                  _valueNotifier.value = !_valueNotifier.value;
                },
                child: IgnorePointer(
                  child: Icon(
                    _valueNotifier.value
                        ? Icons.visibility_off
                        : Icons.visibility,
                    semanticLabel: _valueNotifier.value
                        ? WidgetConstants.showPassword
                        : WidgetConstants.hidePassword,
                  ),
                ),
              ),
              border: InputBorder.none,
            ),
          ),
        );
      },
    );
  }
}
