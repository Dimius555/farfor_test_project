import 'package:farfor_test_project/configurations/interfaces/sales_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sales_event.dart';
part 'sales_state.dart';

class SalesBloc extends Bloc<SalesEvent, SalesState> {
  // Статические методы для прослушивания и получения блока
  static SalesState watchState(BuildContext context) => context.watch<SalesBloc>().state;
  static SalesBloc read(BuildContext context) => context.read<SalesBloc>();

  final SalesRepository _salesRepository;

  SalesBloc({required SalesRepository salesRepository})
      : _salesRepository = salesRepository,
        super(SalesState(DateTime.now(), LoadingSales())) {
    on<FetchSalesEvent>((event, emit) async {
      emit(SalesState(DateTime.now(), LoadingSales()));
      final dt = await _salesRepository.getSaleDateTime();
      emit(SalesState(dt, OkSales()));
    });

    on<SetSalesDateTimeEvent>((event, emit) async {
      emit(SalesState(DateTime.now(), LoadingSales()));
      await _salesRepository.setSaleDateTime();
      final dt = await _salesRepository.getSaleDateTime();
      emit(SalesState(dt, OkSales()));
    });
  }
}
