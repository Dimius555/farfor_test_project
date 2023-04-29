import 'package:farfor_test_project/configurations/theme/app_theme.dart';
import 'package:farfor_test_project/data/models/dish_category.dart';
import 'package:farfor_test_project/views/widgets/cached_image.dart';
import 'package:flutter/material.dart';

class DishCategoryWidget extends StatelessWidget {
  const DishCategoryWidget({
    super.key,
    required this.category,
    this.aspectRatio = 163 / 123.56,
    required this.onPressed,
  });

  final DishCategory category;
  final double aspectRatio;
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
          onTap: () {
            onPressed.call();
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(aspectRatio: aspectRatio, child: CachedImage(imageURL: category.imageURL)),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  right: 15.0,
                  bottom: 13.0,
                ),
                child: Text(
                  category.name,
                  style: theme.headline4,
                  textAlign: TextAlign.start,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
