import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newz/Backend/fetchSportsnews.dart';
import 'package:newz/Components/searchbar.dart';
import 'package:newz/Utils/Colors.dart';
import 'package:newz/Utils/Text.dart';
import 'package:newz/Utils/constant.dart';
import 'package:newz/Components/bottomsheet.dart';

class SportsNews extends StatefulWidget {
  static const String id = 'SportsNews';

  @override
  _SportsNewsState createState() => _SportsNewsState();
}

class _SportsNewsState extends State<SportsNews> {
  Future<List> news;
  @override
  void initState() {
    super.initState();
    news = fetchSportsNews();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.black,
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              boldText(text: 'SPORTS', color: AppColors.primary, size: 20),
              modifiedText(text: 'NEWS', color: AppColors.lightWhite, size: 20),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          searchBar(),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: FutureBuilder<List>(
                future: fetchSportsNews(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return NewsBox(
                            url: snapshot.data[index]['url'],
                            imageUrl: snapshot.data[index]['urlToImage'] != null
                                ? snapshot.data[index]['urlToImage']
                                : Constants.imageUrl,
                            title: snapshot.data[index]['title'],
                            time: snapshot.data[index]['publishedAt'],
                            description:
                                snapshot.data[index]['description'].toString(),
                          );
                        });
                  } else {
                    return Container(
                        child: Center(
                            child: CircularProgressIndicator(
                      color: AppColors.primary,
                    )));
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NewsBox extends StatelessWidget {
  NewsBox(
      {@required this.url,
      @required this.description,
      @required this.imageUrl,
      @required this.time,
      @required this.title});
  final String imageUrl, title, time, description, url;

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Column(
      children: [
        InkWell(
          onTap: () {
            showMyBottomSheet(context, title, description, imageUrl, url);
          },
          child: Container(
            padding: EdgeInsets.all(20.0),
            margin: EdgeInsets.only(left: 5, right: 5, top: 5),
            width: w,
            color: AppColors.black,
            child: Row(
              children: [
                CachedNetworkImage(
                  imageUrl: imageUrl,
                  imageBuilder: (context, imageProvider) => Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.yellow),
                  ),
                  placeholder: (context, url) => CircularProgressIndicator(
                    color: AppColors.primary,
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    modifiedText(text: title, color: AppColors.white, size: 16),
                    modifiedText(
                        text: time, color: AppColors.lightWhite, size: 12),
                  ],
                ))
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Divider(
            color: AppColors.lightWhite,
          ),
        )
      ],
    );
  }
}
