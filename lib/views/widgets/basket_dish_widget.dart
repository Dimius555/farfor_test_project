import 'package:farfor_test_project/configurations/theme/app_theme.dart';
import 'package:farfor_test_project/data/models/basket_dish.dart';
import 'package:farfor_test_project/views/blocs/basket_bloc/basket_bloc.dart';
import 'package:farfor_test_project/views/widgets/cached_image.dart';
import 'package:farfor_test_project/views/widgets/counter_widget.dart';
import 'package:flutter/material.dart';

class BasketDishWidget extends StatelessWidget {
  const BasketDishWidget({super.key, required this.basketDish});

  final BasketDish basketDish;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.read(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
                    child: CachedImage(imageURL: basketDish.dish.imageURL),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    basketDish.dish.name,
                    style: theme.caption1,
                  ),
                  const SizedBox(height: 10),
                  _basketDishInfo(theme, context),
                ],
              )
            ],
          ),
          const Divider()
        ],
      ),
    );
  }

  Row _basketDishInfo(AppTheme theme, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          children: [
            Text(
              '${basketDish.dish.price} ₽',
              style: theme.headline4,
            ),
            const SizedBox(height: 4),
            Text(
              basketDish.dish.weight,
              style: theme.caption1,
            )
          ],
        ),
        // const Spacer(),
        CounterWidget(
          count: basketDish.count.toString(),
          onCountPressed: (bool isPlus) {
            if (isPlus) {
              BasketBloc.read(context).add(AddDish(dish: basketDish.dish));
            } else {
              BasketBloc.read(context).add(RemoveDish(dish: basketDish.dish));
            }
          },
        )
      ],
    );
  }
}
