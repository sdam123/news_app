import 'package:flutter/material.dart';
import 'package:news_app/models/catigory_model.dart';
import 'package:news_app/views/catigory_view.dart';

class CatigoryCard extends StatelessWidget {
  const CatigoryCard({super.key, required this.catigoryModel});
  final CatigoryModel catigoryModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (contex) {
          return CatigoryView(
            catigory: catigoryModel.name,
          );
        }));
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 12),
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(catigoryModel.image), fit: BoxFit.fill),
              borderRadius: BorderRadius.circular(8)),
          width: 155,
          height: 85,
          child: Center(
              child: Text(
            catigoryModel.name,
            style: TextStyle(
                color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
          )),
        ),
      ),
    );
  }
}
