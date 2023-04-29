part of 'sales_bloc.dart';

abstract class SalesEvent {}

class FetchSalesEvent extends SalesEvent {}

class SetSalesDateTimeEvent extends SalesEvent {}
