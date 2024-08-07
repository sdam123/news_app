import 'package:flutter/material.dart';

import 'package:news_app/widget/catigory_list_view.dart';

import 'package:news_app/widget/news_list_view_bulder.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('News', style: TextStyle(color: Colors.black)),
            Text('Cloud', style: TextStyle(color: Colors.orange)),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(child: CatigoryListView()),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 22,
              ),
            ),
            NewsListViewBulder(catigory: 'general')
          ],
        ),
      ),
    );
  }
}
