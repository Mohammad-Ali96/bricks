import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ShareButton extends StatelessWidget {
  final String url;
  final String chooserTitle;
  final String title;
  final String accessText;
  final String accessCodeText;

  const ShareButton({
    Key? key,
    required this.url,
    required this.accessText,
    required this.accessCodeText,
    required this.chooserTitle,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await Share.share(
          '$chooserTitle\n$title\n$accessText\n$url\n$accessCodeText',
        );
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: Center(
          child:
              Icon(Icons.share, color: Theme.of(context).colorScheme.secondary),
        ),
      ),
    );
  }
}
