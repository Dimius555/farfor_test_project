import 'package:shared_preferences/shared_preferences.dart';

class SalesDataSource {
  final SharedPreferences prefs;

  const SalesDataSource({
    required this.prefs,
  });

  static const String _saleKey = '_sales_key';

  Future<bool> setDateTime(DateTime dt) async {
    return await prefs.setString(_saleKey, dt.toString());
  }

  String? getDateTime() {
    return prefs.getString(_saleKey);
  }
}
