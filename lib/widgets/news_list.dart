import 'package:flutter/material.dart';
import 'package:news_app_try/models/artical_model.dart';
import 'package:news_app_try/widgets/news_tile.dart';

class NewsList extends StatelessWidget {
  const NewsList({super.key, required this.articals});
  final List<ArticalModel> articals;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: articals.length,
        (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom:22),
            child: NewsTile(articalModel: articals[index],),
          );
        },
      ),
    );
  }
}
