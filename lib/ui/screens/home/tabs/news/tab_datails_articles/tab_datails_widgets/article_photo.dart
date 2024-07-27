import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ArticlePhoto extends StatefulWidget {
  static const String routeName = 'article photo';

  const ArticlePhoto({super.key});

  @override
  State<ArticlePhoto> createState() => _ArticlePhotoState();
}

class _ArticlePhotoState extends State<ArticlePhoto> {
  @override
  Widget build(BuildContext context) {
    final String urlToImage = ModalRoute.of(context)!.settings.arguments as String;

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.contain,
            onError: (exception, stackTrace) => const Center(
                  child: Row(children: [Text('unable to load image')]),
                ),
            image: CachedNetworkImageProvider(urlToImage),
            filterQuality: FilterQuality.high),
      ),
    );
  }
}
