import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newapp/src/models/category_model.dart';
import 'package:newapp/src/services/news_service.dart';
import 'package:newapp/src/themes/theme.dart';
import 'package:newapp/src/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';

class Tab2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);
    print(newsService.getArticleCategorySelected);

    return SafeArea(
        child: Scaffold(
      body: Column(
        children: <Widget>[
          _ListaCategorias(),
          Expanded(
            child: ListaNoticias(newsService.getArticleCategorySelected),
          )
        ],
      ),
    ));
  }
}

class _ListaCategorias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<NewsService>(context).categories;

    return Container(
      width: double.infinity,
      height: 80,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          final name = categories[index].name;

          return Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              children: <Widget>[
                _CategoryButton(categories[index]),
                SizedBox(
                  height: 5,
                ),
                Text('${name[0].toUpperCase()}${name.substring(1)}')
              ],
            ),
          );
        },
      ),
    );
  }
}

class _CategoryButton extends StatelessWidget {
  final Category category;

  _CategoryButton(this.category);

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);

    return GestureDetector(
      onTap: () {
        newsService.selectedCategory = this.category.name;
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: Icon(
          category.icon,
          color: (this.category.name == newsService.selectedCategory) ? miTema.accentColor : Colors.black54,
        ),
      ),
    );
  }
}
