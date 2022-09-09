import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:tesis_1/app/data/data_source/services/news_service.dart';
import 'package:tesis_1/app/ui/pages/home/tabs/home/news/news_controller.dart';
import 'package:tesis_1/app/ui/pages/home/tabs/home/news/widgets/list_news.dart';

final newsService = SimpleProvider(
  (ref) => NewsService(),
);

class NationalTab extends StatelessWidget {
  const NationalTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(builder: (_, ref, __) {
        final controller = ref.watch(newsService);
        return List_News(controller.headlines);
      }),
    );
  }
}
