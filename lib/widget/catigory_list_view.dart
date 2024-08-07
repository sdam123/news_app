import 'package:flutter/material.dart';
import 'package:news_app/models/catigory_model.dart';
import 'package:news_app/widget/catigory_card.dart';

// ignore: must_be_immutable
class CatigoryListView extends StatelessWidget {
  CatigoryListView({
    super.key,
  });

  List<CatigoryModel> catigorys = const [
    CatigoryModel(name: 'business', image: 'assets/business.avif'),
    CatigoryModel(name: 'general', image: 'assets/general.avif'),
    CatigoryModel(name: 'health', image: 'assets/health.avif'),
    CatigoryModel(name: 'science', image: 'assets/science.avif'),
    CatigoryModel(name: 'sports', image: 'assets/sports.avif'),
    CatigoryModel(name: 'technology', image: 'assets/technology.jpeg')
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 95,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: catigorys.length,
        itemBuilder: (context, index) {
          return CatigoryCard(catigoryModel: catigorys[index]);
        },
      ),
    );
  }
}
