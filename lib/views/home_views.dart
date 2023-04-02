import 'package:flutter/material.dart';
import 'package:step_3/components/news_card.dart';
import 'package:step_3/constants/text_constants.dart';
import 'package:step_3/models/country_model.dart';

import 'package:step_3/models/topnews_model.dart';
import 'package:step_3/services/fetch_service.dart';
import 'package:step_3/theme/app_colors.dart';
import 'package:step_3/views/seach_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TopNews? topNews;
  Future<void> fetchNews([String? domain]) async {
    topNews = null;
    setState(() {});
    topNews = await NewsRepo().fetchTopNews(domain);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  var selectedItem = '';

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primari,
        leading: const Icon(Icons.newspaper_outlined),
        title: const Text(AppText.topNewsAppBartitle),
        actions: [
          PopupMenuButton<Country>(
            onSelected: (Country item) async {
              await fetchNews(item.domain);
            },
            itemBuilder: (BuildContext context) {
              return countries
                  .map(
                    (e) => PopupMenuItem<Country>(
                      value: e,
                      child: Text(e.name),
                    ),
                  )
                  .toList();
            },
          ),
        ],
      ),
      body: topNews == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: topNews!.articles.length,
              itemBuilder: (BuildContext context, int index) {
                final news = topNews!.articles[index];
                return CardNews(news: news);
              },
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.white,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) => const SeachView()),
            ),
          );
        },
        child: const Icon(
          Icons.search,
          color: AppColors.primari,
        ),
      ),
    );
  }
}
