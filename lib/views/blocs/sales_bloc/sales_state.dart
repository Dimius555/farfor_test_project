part of 'sales_bloc.dart';

class SalesState {
  final DateTime dt;
  final SalesStatus status;

  SalesState(this.dt, this.status);
}

abstract class SalesStatus {}

class OkSales extends SalesStatus {}

class LoadingSales extends SalesStatus {}
