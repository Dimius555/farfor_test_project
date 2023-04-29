import 'package:farfor_test_project/configurations/theme/app_theme.dart';
import 'package:farfor_test_project/data/models/dish.dart';
import 'package:farfor_test_project/views/blocs/basket_bloc/basket_bloc.dart';
import 'package:farfor_test_project/views/widgets/cached_image.dart';
import 'package:farfor_test_project/views/widgets/counter_widget.dart';
import 'package:farfor_test_project/views/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';

class DishDetailsPage extends StatefulWidget {
  DishDetailsPage({super.key, required this.dish});

  final Dish dish;

  @override
  State<DishDetailsPage> createState() => _DishDetailsPageState();
}

class _DishDetailsPageState extends State<DishDetailsPage> {
  late bool _isInBasket;

  void _checkBasket(BasketState state) {
    try {
      state.dishes.firstWhere((element) => element.dish.id == widget.dish.id);
      _isInBasket = true;
    } catch (e) {
      _isInBasket = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.read(context);
    final basketState = BasketBloc.watchState(context);
    _checkBasket(basketState);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 10, bottom: 26),
            width: 30,
            height: 6,
            decoration: BoxDecoration(
              color: theme.notchColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(3.0),
              ),
            ),
          ),
          AspectRatio(aspectRatio: 335 / 221, child: CachedImage(imageURL: widget.dish.imageURL)),
          const SizedBox(height: 24),
          Text(
            widget.dish.name,
            style: theme.regular1,
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Text(
                '${widget.dish.price} ₽',
                style: theme.regular1,
              ),
              const Spacer(),
              if (_isInBasket)
                CounterWidget(
                    onCountPressed: (isPlus) {
                      if (isPlus) {
                        BasketBloc.read(context).add(AddDish(dish: widget.dish));
                      } else {
                        BasketBloc.read(context).add(RemoveDish(dish: widget.dish));
                      }
                    },
                    count: basketState.dishes.firstWhere((element) => element.dish.id == widget.dish.id).count.toString()),
              if (!_isInBasket)
                CustomTextButton(
                    text: 'Хочу!',
                    onPressed: () {
                      BasketBloc.read(context).add(AddDish(dish: widget.dish));
                    })
            ],
          ),
          const SizedBox(height: 24),
          if (widget.dish.description != null)
            Text(
              widget.dish.description!,
              textAlign: TextAlign.start,
              style: theme.regular3.copyWith(color: theme.textSecondaryColor),
            )
        ],
      ),
    );
  }
}
