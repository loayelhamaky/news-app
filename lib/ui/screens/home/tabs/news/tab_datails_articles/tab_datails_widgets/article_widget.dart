import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../../../ constants/constants.dart';
import '../../../../../../../model_api/articles_response/ArticlesResponse.dart';
import '../../../../../../../model_api/articles_response/article.dart';
import 'article_photo.dart';

class ArticleWidget extends StatefulWidget {
  final Article article;
  final List<Article?> articles;
  const ArticleWidget(
      {super.key, required this.article, required this.articles});

  @override
  State<ArticleWidget> createState() => _ArticleWidgetState();
}

class _ArticleWidgetState extends State<ArticleWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// cached image network like facebook
        Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 10),
          child: InkWell(
            onTap: () async {
              await Navigator.pushNamed(context, ArticlePhoto.routeName,
                  arguments: widget.article.urlToImage);
              setState(() {});
            },
            child: CachedNetworkImage(
              fadeInCurve: Curves.easeInOut,
              imageUrl: widget.article.urlToImage ?? '',
              errorWidget: (context, url, error) => const Center(
                child: Row(children: [Text('unable to load image')]),
              ),
              placeholder: (context, url) => Container(
                color: Colors.grey.withOpacity(0.3),
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width * 0.9,
              ),
            ),
          ),
        ),

        Text(widget.article.title ?? '', style: const TextStyle(fontSize: 20)),
        Container(height: 10),
        Text(widget.article.description ?? '',
            overflow: TextOverflow.ellipsis,
            maxLines: 5,
            style: const TextStyle(fontSize: 15)),
        Row(
          children: [
            Text('read the full article :',
                style: TextStyle(color: Colors.black.withOpacity(0.8))),
            Expanded(
                child: TextButton(
              style: ButtonStyle(
                  foregroundColor:
                      MaterialStatePropertyAll(Constants.primaryColor),
                  textStyle: const MaterialStatePropertyAll(
                      TextStyle(fontWeight: FontWeight.bold))),
              onPressed: () {
                if (widget.article.url != null) {
                  print(widget.article.url);
                  launchUrl(Uri.parse(widget.article.url!));
                } else if (widget.article.url == null) {
                  print('null url');
                }
              },
              child: Text(
                "${widget.article.url}",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            )),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "published at ${widget.article.publishedAt!.substring(0, 10)} " ??
                    '',
                textAlign: TextAlign.end,
              ),
              const Text(' : '),
              Text(
                widget.article.publishedAt!.substring(11, 16) ?? '',
                textAlign: TextAlign.end,
              ),
            ],
          ),
        ),
        Container(
          height: 1,
          width: MediaQuery.of(context).size.width,
          color: Colors.black,
        )
      ],
    );
  }
}
