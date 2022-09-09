import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:tesis_1/app/domain/models/news_models.dart';

class List_News extends StatelessWidget {
  final List<Article> news;

  const List_News(this.news);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.news.length,
      itemBuilder: (BuildContext context, int index) {
        return _News(
          newss: this.news[index],
          index: index,
        );
      },
    );
  }
}

class _News extends StatelessWidget {
  final Article newss;
  final int index;

  const _News({required this.newss, required this.index});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _CardTopBar(newss, index),
        _CardTitle(newss),
        _CardImage(newss),
      ],
    );
  }
}

class _CardImage extends StatelessWidget {
  final Article newss;

  const _CardImage(this.newss);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.isDarkMode;
    return Container(
      child: FadeInImage(
        placeholder: AssetImage(
            'assets/images/${isDarkMode ? 'dark' : 'light'}/giphy.gif'),
        image: NetworkImage(newss.urlToImage),
      ),
    );
  }
}

class _CardTitle extends StatelessWidget {
  final Article newss;

  const _CardTitle(this.newss);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        newss.title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      ),
    );
  }
}

class _CardTopBar extends StatelessWidget {
  final Article newss;
  final int index;

  const _CardTopBar(this.newss, this.index);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: <Widget>[
          Text(
            '${index + 1}. ',
            style: TextStyle(color: Colors.red),
          ),
          Text('${newss.source.name}. '),
        ],
      ),
    );
  }
}
