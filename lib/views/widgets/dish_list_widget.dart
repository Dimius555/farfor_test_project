import 'package:easy_localization/easy_localization.dart';
import 'package:farfor_test_project/configurations/localization/locale_keys.g.dart';
import 'package:farfor_test_project/configurations/theme/app_theme.dart';
import 'package:farfor_test_project/data/constants.dart';
import 'package:farfor_test_project/data/models/dish.dart';
import 'package:farfor_test_project/views/blocs/basket_bloc/basket_bloc.dart';
import 'package:farfor_test_project/views/widgets/cached_image.dart';
import 'package:farfor_test_project/views/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';

import 'app_actions_dialog.dart';
import 'counter_widget.dart';

class DishListWidget extends StatefulWidget {
  const DishListWidget({
    super.key,
    required this.dish,
    required this.onPressed,
  });

  final Dish dish;
  final Function onPressed;

  @override
  State<DishListWidget> createState() => _DishListWidgetState();
}

class _DishListWidgetState extends State<DishListWidget> {
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
            widget.onPressed.call();
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
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    child: CachedImage(imageURL: widget.dish.imageURL),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10.0,
                    right: 15.0,
                    bottom: 13.0,
                  ),
                  child: Text(
                    widget.dish.name,
                    style: theme.headline4,
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${widget.dish.price} ₽',
                      style: theme.headline4,
                    ),
                    const Spacer(),
                    if (!_isInBasket)
                      CustomIconButton(
                        svgIcon: AppIcons.iconPlus,
                        onPressed: () {
                          BasketBloc.read(context).add(AddDish(dish: widget.dish));
                        },
                      )
                  ],
                ),
                if (_isInBasket)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
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
