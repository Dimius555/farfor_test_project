import 'package:cached_network_image/cached_network_image.dart';
import 'package:farfor_test_project/data/cache/default_cache_manager.dart';
import 'package:flutter/material.dart';

class CachedImage extends StatelessWidget {
  const CachedImage({super.key, required this.imageURL});

  final String imageURL;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: BoxFit.fill,
      imageUrl: imageURL,
      cacheManager: DefaultCacheManager(),
      placeholder: (_, __) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
