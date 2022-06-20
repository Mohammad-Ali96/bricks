import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';


typedef OnDisableClicked = void Function();
typedef OnRetry = void Function();

class CustomDropDownWidget<T> extends StatelessWidget {
  final String? hint;
  final List<T>? options;
  final Function(T)? onChange;
  final bool? showError;
  final String? messageError;
  final bool? isLoading;
  final bool? showRetryIcon;
  final OnRetry? onRetry;
  final double? hintWidth;
  final bool? disabled;
  final OnDisableClicked? onDisableClicked;
  final T? selectedOption;
  final Color? borderColor;
  final String? label;

  const CustomDropDownWidget({
    Key? key,
    this.label,
    this.hint,
    required this.options,
    required this.onChange,
    this.showError = false,
    this.messageError = '',
    this.isLoading = false,
    this.borderColor,
    this.showRetryIcon = false,
    this.disabled = false,
    required this.onRetry,
    this.hintWidth,
    this.onDisableClicked,
    this.selectedOption,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // if (T == String) options!.removeAt(0);
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            if (disabled!) {
              onDisableClicked!();
            }
          },
          child: DropdownButtonFormField<T>(
            decoration: InputDecoration(
              labelText: label,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(13),
                borderSide: BorderSide(
                  color: showError!
                      ? Theme.of(context).errorColor
                      : (Theme.of(context).inputDecorationTheme.border
                              as OutlineInputBorder?)!
                          .borderSide
                          .color,
                ),
              ),
            ),
            hint: hint != null ? Text(hint!) : const SizedBox(),
            iconSize: 20.0,
            icon: isLoading!
                ? const SizedBox(
                    width: 16.0,
                    height: 16.0,
                    child: CircularProgressIndicator(
                      strokeWidth: 1.0,
                    ),
                  )
                : const Icon(Icons.keyboard_arrow_down),
            value: selectedOption,
            items: options!.map<DropdownMenuItem<T>>((option) {
              return DropdownMenuItem<T>(
                value: option,
                // ignore: sized_box_for_whitespace
                child: Container(
                  width: hintWidth,
                  child: Text(
                    getTitle(option),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 15,
                      color: Theme.of(context).textTheme.headline1!.color!,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              );
            }).toList(),
            onChanged: (disabled == null || disabled == false)
                ? (val) => onChange!(val!)
                : (item) {},
          ),
        ),
        showError!
            ? const SizedBox(
                height: 3.0,
              )
            : Container(),
        showError!
            ? Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () {
                    onRetry!();
                  },
                  child: Row(
                    children: [
                      Text(
                        messageError!,
                        style: TextStyle(
                            color: Theme.of(context).errorColor,
                            fontSize: 12.0),
                      ),
                      const SizedBox(
                        width: 4.0,
                      ),
                      showRetryIcon!
                          ? Icon(
                              Icons.refresh,
                              color: Theme.of(context).errorColor,
                              size: 16.0,
                            )
                          : Container()
                    ],
                  ),
                ),
              )
            : Container()
      ],
    );
  }

  String getTitle(T item) {
    if (T.toString() == 'PersonType') {
      return item.toString().substring(11);
    } else if (T.toString() == 'FloorType') {
      if (item.toString().contains('_')) {
        return item.toString().substring(10).replaceAll('_', ' ');
      } else {
        return item.toString().substring(10).tr();
      }
    } else if (T.toString() == 'Suffix') {
      return item.toString().substring(7);
    } else if (T.toString() == 'SpaceType') {
      if (item.toString().contains('_')) {
        return item.toString().substring(10).replaceAll('_', ' ');
      }
      return item.toString().substring(10).tr();
    } else if (T.toString() == 'VehicleTypeEnum') {
      return item.toString().substring(16);
    } else {
      return item.toString();
    }
  }
}
