import 'package:flutter/material.dart';
import 'package:news_app_try/widgets/category_list.dart';
import 'package:news_app_try/widgets/news_list_builder.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Center(
          child: Text.rich(
            TextSpan(children: <TextSpan>[
              TextSpan(
                text: 'News',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: 'Cloud',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.orange,
                ),
              ),
            ]),
          ),
        ),
      ),
      body:const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
              SliverToBoxAdapter(//chenge it's child to sliver
             child: categoryList(), // Instantiate CategoryList widget
            ),
             SliverToBoxAdapter(
              child: SizedBox(height: 24),
            ),
            NewsBuilder(categoryName: 'general',),
          ],
        ),
      ),
    );
  }
}
