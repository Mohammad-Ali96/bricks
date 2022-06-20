
import 'package:flutter/material.dart';

class CustomTextFieldWidget<T> extends StatelessWidget {
  final String? hint;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final Function(String)? onChange;
  final Function(String)? onSubmitted;
  final bool? showError;
  final String? messageError;
  final TextInputType? keyboardType;
  final FocusNode? focus;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? obscureText;
  final Color? borderColor;

  const CustomTextFieldWidget({
    Key? key,
    this.hint,
    this.controller,
    this.onChange,
    this.onSubmitted,
    this.showError = false,
    this.messageError = '',
    this.keyboardType = TextInputType.name,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.focus,
    this.borderColor,
    this.textInputAction = TextInputAction.done,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          textInputAction: textInputAction!,
          controller: controller,
          obscureText: obscureText!,
          focusNode: focus,
          onChanged: (val) {
            if (onChange != null) {
              onChange!(val);
            }
          },
          onSubmitted: onSubmitted,
          keyboardType: keyboardType,
          style: TextStyle(
            color: Color(0XFFFFFFFF),
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
            hintText: hint,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: showError!
                    ? Theme
                    .of(context)
                    .errorColor
                    : (Theme
                    .of(context)
                    .inputDecorationTheme
                    .border
                as OutlineInputBorder?)!
                    .borderSide
                    .color,
              ),
            ),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                    color: (Theme
                        .of(context)
                        .inputDecorationTheme
                        .border
                    as OutlineInputBorder?)!
                        .borderSide
                        .color)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: borderColor == null
                      ? (Theme
                      .of(context)
                      .inputDecorationTheme
                      .border
                  as OutlineInputBorder?)!
                      .borderSide
                      .color
                      : borderColor!,
                )),
          ),
        ),
        showError!
            ? SizedBox(
          height: 3.0,
        )
            : Container(),
        showError!
            ? Align(
          alignment: Alignment.centerLeft,
          child: Text(
            messageError!,
            style: TextStyle(
                color: Theme
                    .of(context)
                    .errorColor, fontSize: 12.0),
          ),
        )
            : Container()
      ],
    );
  }
}
