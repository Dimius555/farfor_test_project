import 'package:farfor_test_project/configurations/theme/app_theme.dart';
import 'package:farfor_test_project/views/widgets/cached_image.dart';
import 'package:farfor_test_project/views/widgets/counter_widget.dart';
import 'package:flutter/material.dart';

class BasketDishWidget extends StatelessWidget {
  const BasketDishWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.read(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            SizedBox(
              width: 59,
              child: AspectRatio(
                aspectRatio: 59 / 39,
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  child: const CachedImage(imageURL: 'https://picsum.photos/200/300'),
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Мясная пицца',
                  style: theme.caption1,
                ),
                _basketDishInfo(theme),
              ],
            )
          ],
        ),
        const Divider()
      ],
    );
  }

  Row _basketDishInfo(AppTheme theme) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          children: [
            Text(
              '300 P',
              style: theme.headline4,
            ),
            Text(
              '200 g',
              style: theme.caption1,
            )
          ],
        ),
        CounterWidget(
          count: '2',
          onCountPressed: (bool isPlus) {},
        )
      ],
    );
  }
}
