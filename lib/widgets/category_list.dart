import 'package:flutter/material.dart';
import 'package:news_app_try/models/category_model.dart';
import 'package:news_app_try/widgets/category_card.dart';

// ignore: camel_case_types
class categoryList extends StatelessWidget {
  const categoryList({super.key});

    final List<CategoryModel> categorys = const [
    CategoryModel(image: 'assets/business.avif', categoryName: 'business'),
    CategoryModel(
        image: 'assets/entertaiment.avif', categoryName: 'entertainment'),
    CategoryModel(image: 'assets/health.avif', categoryName: 'health'),
    CategoryModel(image: 'assets/science.avif', categoryName: 'science'),
    CategoryModel(image: 'assets/sports.avif', categoryName: 'sports'),
    CategoryModel(image: 'assets/technology.jpeg', categoryName: 'tech'),
    CategoryModel(image: 'assets/general.avif', categoryName: 'general'),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 110,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categorys.length,
            itemBuilder: (context, index) {
              return CategoryCard(categoryModel: categorys[index]);
            }),
      );
  }
}