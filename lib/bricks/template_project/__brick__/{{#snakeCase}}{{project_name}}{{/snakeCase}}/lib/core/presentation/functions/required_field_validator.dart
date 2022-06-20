import 'package:easy_localization/easy_localization.dart';

String? requiredFieldValidator(String? text) {
  if (text == null || text.isEmpty) {
    return 'field_required_message'.tr();
  }

  return null;
}
