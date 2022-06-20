import '/../core/presentation/utils/message_utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ClipBoardButton extends StatelessWidget {
  final String txt;

  const ClipBoardButton({Key? key, required this.txt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Clipboard.setData(ClipboardData(text: txt));
        MessageUtils.showMessage(
          context,
          'text_copied_to_clipboard'.tr(),
        );
      },
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: Center(
          child: Icon(Icons.content_copy,
              color: Theme.of(context).colorScheme.secondary),
        ),
      ),
    );
  }
}
