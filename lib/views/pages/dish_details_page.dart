import 'package:easy_localization/easy_localization.dart';
import 'package:farfor_test_project/configurations/localization/locale_keys.g.dart';
import 'package:farfor_test_project/configurations/theme/app_theme.dart';
import 'package:farfor_test_project/data/models/dish.dart';
import 'package:farfor_test_project/views/blocs/basket_bloc/basket_bloc.dart';
import 'package:farfor_test_project/views/widgets/cached_image.dart';
import 'package:farfor_test_project/views/widgets/counter_widget.dart';
import 'package:farfor_test_project/views/widgets/custom_buttom.dart';
import 'package:farfor_test_project/views/widgets/app_actions_dialog.dart';
import 'package:flutter/material.dart';

class DishDetailsPage extends StatefulWidget {
  const DishDetailsPage({super.key, required this.dish});

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
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: const EdgeInsets.only(top: 10, bottom: 26),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: theme.notchColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(2.0),
                ),
              ),
            ),
          ),
          const SizedBox(height: 26),
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
                        if (basketState.dishes.firstWhere((element) => element.dish.id == widget.dish.id).count == 1) {
                          showDialog(
                              context: context,
                              builder: (cntxt) {
                                return AppActionDialog(
                                    approveButtonCallback: () {
                                      BasketBloc.read(context).add(RemoveDish(dish: widget.dish));
                                      Navigator.pop(cntxt);
                                    },
                                    approveButtonTitle: LocaleKeys.yes.tr(),
                                    disapproveButtonCallback: () {
                                      Navigator.pop(cntxt);
                                    },
                                    disapproveButtonTitle: LocaleKeys.no.tr(),
                                    text: '${LocaleKeys.remove_dish_from_basket_question.tr()} ${widget.dish.name}?');
                              });
                        } else {
                          BasketBloc.read(context).add(RemoveDish(dish: widget.dish));
                        }
                      }
                    },
                    count: basketState.dishes.firstWhere((element) => element.dish.id == widget.dish.id).count.toString()),
              if (!_isInBasket)
                CustomTextButton(
                    text: LocaleKeys.i_want_it.tr(),
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
