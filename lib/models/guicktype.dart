// To parse this JSON data, do
//
//     final topNews = topNewsFromJson(jsonString);

// import 'dart:convert';

// TopNews topNewsFromJson(String str) => TopNews.fromJson(json.decode(str));

// class TopNews {
//   TopNews({
//     required this.status,
//     required this.totalResults,
//     required this.articles,
//   });

//   String status;
//   int totalResults;
//   List<Article> articles;

//   factory TopNews.fromJson(Map<String, dynamic> json) => TopNews(
//         status: json["status"],
//         totalResults: json["totalResults"],
//         articles: List<Article>.from(
//             json["articles"].map((x) => Article.fromJson(x))),
//       );
// }

// class Article {
//   Article({
//     required this.source,
//     this.author,
//     required this.title,
//     this.description,
//     required this.url,
//     this.urlToImage,
//     required this.publishedAt,
//     this.content,
//   });

//   Source source;
//   String? author;
//   String title;
//   String? description;
//   String url;
//   String? urlToImage;
//   DateTime publishedAt;
//   String? content;

//   factory Article.fromJson(Map<String, dynamic> json) => Article(
//         source: Source.fromJson(json["source"]),
//         author: json["author"],
//         title: json["title"],
//         description: json["description"],
//         url: json["url"],
//         urlToImage: json["urlToImage"],
//         publishedAt: DateTime.parse(json["publishedAt"]),
//         content: json["content"],
//       );
// }

// class Source {
//   Source({
//     this.id,
//     required this.name,
//   });

//   String? id;
//   String name;

//   factory Source.fromJson(Map<String, dynamic> json) => Source(
//         id: json["id"],
//         name: json["name"],
//       );
// }
