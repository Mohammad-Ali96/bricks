import '/../core/data/utils/constants.dart';
import '/../injection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomDialogWidget extends StatefulWidget {
  final String title;
  final String message;
  final String buttonName;
  final Function onButtonClick;

  const CustomDialogWidget(
      {required this.title,
      required this.message,
      required this.buttonName,
      required this.onButtonClick,
      Key? key})
      : super(key: key);

  @override
  State<CustomDialogWidget> createState() => _CustomDialogWidgetState();
}

class _CustomDialogWidgetState extends State<CustomDialogWidget> {
  late bool _darkMode;

  @override
  void initState() {
    super.initState();
    final SharedPreferences sharedPreferences = getIt<SharedPreferences>();
    _darkMode =
        sharedPreferences.getBool(SharedPreferencesKeys.isDarkMode) ?? true;
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(),
      child: AlertDialog(
          scrollable: true,
          insetPadding: const EdgeInsets.only(left: 22, right: 22),
          contentPadding: const EdgeInsets.all(0),
          shape: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide.none),
          content: Container(
            padding: const EdgeInsets.all(20.0),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.transparent, width: 0.5),
              borderRadius: BorderRadius.circular(9),
              color: _darkMode ? Theme.of(context).cardColor : null,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    widget.title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  widget.message,
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                const SizedBox(
                  height: 36,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2),
                            ),
                            fixedSize: const Size.fromHeight(39),
                            padding: const EdgeInsets.all(8)),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'close'.tr(),
                          style:
                              Theme.of(context).textTheme.subtitle1!.copyWith(
                                    color: Colors.black,
                                  ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).errorColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2),
                            ),
                            fixedSize: const Size.fromHeight(39),
                            padding: const EdgeInsets.all(8)),
                        onPressed: () {
                          Navigator.of(context).pop();
                          widget.onButtonClick();
                        },
                        child: Text(
                          widget.buttonName,
                          style: Theme.of(context).textTheme.subtitle1!,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
