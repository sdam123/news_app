import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/artical_model.dart';
import 'package:news_app/service/news_service.dart';

import 'package:news_app/widget/news_list_veiw.dart';

class NewsListViewBulder extends StatefulWidget {
  final String catigory;

  const NewsListViewBulder({super.key, required this.catigory});
  @override
  State<NewsListViewBulder> createState() => _NewsListViewBulderState();
}

class _NewsListViewBulderState extends State<NewsListViewBulder> {
  Widget widget1 = wigmsg(msg: 'Network connection failed');
  var futur;
  @override
  void initState() {
    super.initState();
    futur = NewsService(dio: Dio()).getNews(category: widget.catigory);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticalModel>>(
      future: futur,
      builder: (contex, snaphot) {
        if (snaphot.hasData) {
          return NewsListView(
            articals: snaphot.data!,
          );
        } else if (snaphot.hasError) {
          return SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                widget1,
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(150, 50),
                          backgroundColor: Color(0xffbbbbbb)),
                      onPressed: () {
                        widget1 = wiglod();

                        setState(() {
                          futur = NewsService(dio: Dio())
                              .getNews(category: widget.catigory);
                        });
                      },
                      child: Text(
                        'Try again',
                        style: TextStyle(fontSize: 18),
                      )),
                )
              ],
            )),
          );
        } else {
          return SliverFillRemaining(
            hasScrollBody: false,
            child: wiglod(),
          );
        }
      },
    );
  }
}

class wiglod extends StatelessWidget {
  const wiglod({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

class wigmsg extends StatelessWidget {
  const wigmsg({
    super.key,
    required this.msg,
  });

  final String msg;

  @override
  Widget build(BuildContext context) {
    return Text(
      msg,
      style: TextStyle(
          fontSize: 22, color: Colors.black, fontWeight: FontWeight.w600),
    );
  }
}
