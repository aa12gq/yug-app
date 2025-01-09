import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yug_app/common/i18n/locale_keys.dart';
import 'package:yug_app/pages/system/login/controller.dart';

class AgreementCheckbox extends GetView<LoginController> {
  const AgreementCheckbox({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        children: [
          SizedBox(
            width: 24,
            height: 24,
            child: Checkbox(
              value: controller.isAgreementChecked.value,
              onChanged: (value) => controller.toggleAgreement(),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 12,
                  color: Theme.of(context).textTheme.bodyMedium?.color,
                ),
                children: [
                  TextSpan(text: LocaleKeys.loginAgreementCheck.tr),
                  TextSpan(text: LocaleKeys.loginAgreementPrefix.tr),
                  TextSpan(
                    text: LocaleKeys.loginUserAgreement.tr,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = controller.openUserAgreement,
                  ),
                  TextSpan(text: LocaleKeys.loginAgreementSuffix.tr),
                  TextSpan(text: LocaleKeys.loginAgreementAnd.tr),
                  TextSpan(text: LocaleKeys.loginAgreementPrefix.tr),
                  TextSpan(
                    text: LocaleKeys.loginPrivacyPolicy.tr,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = controller.openPrivacyPolicy,
                  ),
                  TextSpan(text: LocaleKeys.loginAgreementSuffix.tr),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
