import 'package:flutter/material.dart';
import 'package:news_app_try/models/artical_model.dart';
import 'package:news_app_try/services/news_service.dart';
import 'package:news_app_try/widgets/news_list.dart';

class NewsBuilder extends StatefulWidget {
  const NewsBuilder({super.key, required this.categoryName});

  final String categoryName;

  @override
  State<NewsBuilder> createState() => _NewsBuilderState();
}


class _NewsBuilderState extends State<NewsBuilder> {
  var future;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    future = NewsService().getTopHeadlines(category: widget.categoryName);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticalModel>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SliverToBoxAdapter(
                child: Center(
                    heightFactor: 15, child: CircularProgressIndicator()));
          } else if (snapshot.hasError) {
            return SliverToBoxAdapter(
                child: Center(child: Text('Error: {$snapshot.error}')));
          } else {
            return NewsList(articals: snapshot.data ?? []);
          }
        });
  }
}
