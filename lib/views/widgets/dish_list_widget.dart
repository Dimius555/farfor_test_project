import 'package:farfor_test_project/configurations/theme/app_theme.dart';
import 'package:farfor_test_project/data/constants.dart';
import 'package:farfor_test_project/views/widgets/cached_image.dart';
import 'package:farfor_test_project/views/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';

class DishListWidget extends StatelessWidget {
  const DishListWidget({
    super.key,
    required this.categoryName,
    required this.imageURL,
    required this.onPressed,
  });

  final String categoryName;
  final String imageURL;

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.read(context);
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: theme.primaryBackgroundColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(16.0),
        ),
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor,
            offset: const Offset(0, 4),
            blurRadius: 20,
          ),
        ],
      ),
      child: Material(
        child: InkWell(
          borderRadius: const BorderRadius.all(
            Radius.circular(16.0),
          ),
          onTap: () {
            onPressed.call();
          },
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                AspectRatio(
                  aspectRatio: 149 / 98,
                  child: Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    child: CachedImage(imageURL: imageURL),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10.0,
                    right: 15.0,
                    bottom: 13.0,
                  ),
                  child: Text(
                    'Мясная',
                    style: theme.headline4,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '300 ₽',
                      style: theme.headline4,
                    ),
                    const CustomIconButton(svgIcon: AppIcons.iconPlus)
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
