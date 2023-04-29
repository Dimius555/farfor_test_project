import 'package:farfor_test_project/data/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomBackButton extends StatelessWidget implements BackButton {
  const CustomBackButton({super.key, required this.onTap, this.iconColor = Colors.black});

  final Function onTap;

  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(19.0),
        child: SvgPicture.asset(
          AppIcons.iconBackArrow,
          width: 18,
          height: 18,
        ),
      ),
    );
  }

  @override
  Color? get color => iconColor;

  @override
  VoidCallback? get onPressed => onTap.call();
}
