import 'package:flutter/material.dart';
import 'package:step_3/components/news_card.dart';
import 'package:step_3/constants/text_constants.dart';
import 'package:step_3/models/topnews_model.dart';
import 'package:step_3/services/fetch_service.dart';
import 'package:step_3/theme/app_colors.dart';

class SeachView extends StatefulWidget {
  const SeachView({Key? key}) : super(key: key);

  @override
  _SeachViewState createState() => _SeachViewState();
}

class _SeachViewState extends State<SeachView> {
  TopNews? topNews;
  bool isSearch = false;
  Future<void> fetchDate(String text) async {
    isSearch = true;
    setState(() {});
    topNews = await NewsRepo().fetchSearchNews(text);
    isSearch = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primari,
        title: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(5)),
          child: Center(
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {},
                  ),
                  hintText: 'Search...',
                  border: InputBorder.none),
              onSubmitted: (value) async {
                await fetchDate(value);
              },
              // onChanged: (value) async {
              //   await Future.delayed(const Duration(milliseconds: 3000));

              //   await fetchDate(value);
              //   print(topNews?.articles);
              // },
            ),
          ),
        ),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    if (isSearch) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (isSearch == false && topNews != null) {
      return ListView.builder(
        itemCount: topNews!.articles.length,
        itemBuilder: (BuildContext context, int index) {
          final news = topNews!.articles[index];
          return CardNews(news: news);
        },
      );
    } else {
      return const Center(
        child: Text(AppText.pleasSearch),
      );
    }
  }
}
// appBar: AppBar(
      //   backgroundColor: AppColors.primari,
      //   // leading: const Icon(Icons.newspaper_outlined),
      //   title: TextFormField(
      //     decoration: InputDecoration(
      //       enabledBorder: OutlineInputBorder(
      //         borderSide: const BorderSide(
      //             width: 4, color: AppColors.search), //<-- SEE HERE
      //         borderRadius: BorderRadius.circular(20.0),
      //       ),
      //     ),
      //   ),