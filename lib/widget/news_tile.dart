import 'package:flutter/material.dart';
import 'package:news_app/models/artical_model.dart';

import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class NewsTile extends StatelessWidget {
  final ArticalModel articalModel;

  const NewsTile({super.key, required this.articalModel});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return WebviewScaffold(
            url: articalModel.url,
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
            withJavascript: true,
          );
        }));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.network(
              articalModel.image ??
                  'https://alfozanaward.org/wp-content/uploads/2018/04/323858xcitefun-al-fateh-grand-mosque-2.jpg',
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            articalModel.title,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            articalModel.subTitle ?? '',
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
