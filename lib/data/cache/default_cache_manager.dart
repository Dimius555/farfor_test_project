import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class DefaultCacheManager extends CacheManager with ImageCacheManager {
  static const key = '_libCachedImageData';

  static final DefaultCacheManager _instance = DefaultCacheManager._();
  factory DefaultCacheManager() {
    return _instance;
  }

  DefaultCacheManager._() : super(Config(key));
}
