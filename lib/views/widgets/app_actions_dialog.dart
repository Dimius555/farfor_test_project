import 'package:farfor_test_project/configurations/theme/app_theme.dart';
import 'package:farfor_test_project/views/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';

class AppActionDialog extends StatelessWidget {
  const AppActionDialog({
    super.key,
    required this.approveButtonCallback,
    required this.approveButtonTitle,
    required this.disapproveButtonCallback,
    required this.disapproveButtonTitle,
    required this.text,
  });

  final String text;
  final Function approveButtonCallback;
  final String approveButtonTitle;

  final Function disapproveButtonCallback;
  final String disapproveButtonTitle;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.read(context);
    return Wrap(
      runAlignment: WrapAlignment.center,
      children: [
        AlertDialog(
          backgroundColor: theme.primaryBackgroundColor,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
          title: Column(
            children: [
              Text(
                text,
                textAlign: TextAlign.center,
                style: theme.headline4,
              ),
            ],
          ),
          titlePadding: const EdgeInsets.only(top: 19, left: 10, right: 10),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    constraints: const BoxConstraints(minWidth: 120),
                    child: CustomTextButton(
                      text: disapproveButtonTitle,
                      onPressed: () {
                        disapproveButtonCallback.call();
                      },
                    ),
                  ),
                  const SizedBox(width: 20),
                  Container(
                    constraints: const BoxConstraints(minWidth: 120),
                    child: CustomTextButton(
                      text: approveButtonTitle,
                      onPressed: () {
                        approveButtonCallback.call();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
          actionsPadding: const EdgeInsets.symmetric(vertical: 20),
        )
      ],
    );
  }
}
