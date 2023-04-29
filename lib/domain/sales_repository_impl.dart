import 'package:farfor_test_project/configurations/interfaces/sales_repository.dart';
import 'package:farfor_test_project/data/local_data_source/sales_data_source.dart';

class SalesRepositoryImpl implements SalesRepository {
  final SalesDataSource _dataSource;

  SalesRepositoryImpl({required SalesDataSource dataSource}) : _dataSource = dataSource;

  @override
  Future<void> setSaleDateTime() async {
    await _dataSource.setDateTime(DateTime.now().add(const Duration(minutes: 10)));
  }

  @override
  Future<DateTime> getSaleDateTime() async {
    final dtStr = _dataSource.getDateTime();
    try {
      return DateTime.parse(dtStr ?? '');
    } catch (e) {
      await setSaleDateTime();
      return DateTime.now().add(const Duration(minutes: 10));
    }
  }
}
