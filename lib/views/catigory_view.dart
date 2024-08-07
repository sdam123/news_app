import 'package:flutter/material.dart';

import 'package:news_app/widget/news_list_view_bulder.dart';

class CatigoryView extends StatelessWidget {
  const CatigoryView({super.key, required this.catigory});
  final String catigory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('News', style: TextStyle(color: Colors.black)),
              Text('Cloud', style: TextStyle(color: Colors.orange)),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(right: 22, left: 22),
          child: CustomScrollView(
            slivers: [NewsListViewBulder(catigory: catigory)],
          ),
        ));
  }
}
