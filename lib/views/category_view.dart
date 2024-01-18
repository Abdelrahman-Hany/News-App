import 'package:flutter/material.dart';
import 'package:news_app_try/widgets/news_list_builder.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.categoryname});

  final String categoryname;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:const EdgeInsets.symmetric(horizontal: 8),
        child: CustomScrollView(
          slivers: [
            NewsBuilder(categoryName: categoryname,),
          ],
        ),
      ),
    );
  }
}
