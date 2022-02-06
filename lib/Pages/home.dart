import 'package:flutter/material.dart';
import 'package:newz/Backend/Content.dart';
import 'package:newz/Backend/Value.dart';
import 'package:newz/Pages/techNews.dart';
import 'package:newz/Utils/Colors.dart';
import 'package:newz/Utils/Text.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'HomeScreen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        shadowColor: Colors.white,
        elevation: 20.0,
        title: boldText(
          size: 20.0,
          color: AppColors.lightWhite,
          text: 'SELECT CATEGORY',
        ),
        centerTitle: true,
        backgroundColor: AppColors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(23.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                NewsCategory(
                    imageURL:
                        'https://images.pexels.com/photos/1714208/pexels-photo-1714208.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
                    text: 'TECHNOLOGY',
                    onPressed: () {
                      Navigator.pushNamed(context, TechNews.id);
                      Provider.of<Value>(context, listen: false)
                          .changeHeading('TECH');
                      Content.API(1);
                    }),
                SizedBox(
                  width: 23.0,
                ),
                NewsCategory(
                    imageURL:
                        'https://images.pexels.com/photos/2526935/pexels-photo-2526935.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
                    text: 'GENERAL',
                    onPressed: () {
                      Navigator.pushNamed(context, TechNews.id);
                      Provider.of<Value>(context, listen: false)
                          .changeHeading('GENERAL');
                      Content.API(2);
                    }),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: <Widget>[
                NewsCategory(
                    imageURL:
                        'https://images.pexels.com/photos/3259624/pexels-photo-3259624.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                    text: 'HEALTH',
                    onPressed: () {
                      Navigator.pushNamed(context, TechNews.id);
                      Provider.of<Value>(context, listen: false)
                          .changeHeading('HEALTH');
                      Content.API(3);
                    }),
                SizedBox(
                  width: 23.0,
                ),
                NewsCategory(
                    imageURL:
                        'https://images.pexels.com/photos/7648016/pexels-photo-7648016.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
                    text: 'BUSINESS',
                    onPressed: () {
                      Navigator.pushNamed(context, TechNews.id);
                      Provider.of<Value>(context, listen: false)
                          .changeHeading('BIZ');
                      Content.API(4);
                    }),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: <Widget>[
                NewsCategory(
                    imageURL:
                        'https://images.pexels.com/photos/2834917/pexels-photo-2834917.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
                    text: 'SPORTS',
                    onPressed: () {
                      Navigator.pushNamed(context, TechNews.id);
                      Provider.of<Value>(context, listen: false)
                          .changeHeading('SPORTS');
                      Content.API(5);
                    }),
                SizedBox(
                  width: 23.0,
                ),
                NewsCategory(
                    imageURL:
                        'https://images.pexels.com/photos/414860/pexels-photo-414860.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
                    text: 'SCIENCE',
                    onPressed: () {
                      Navigator.pushNamed(context, TechNews.id);
                      Provider.of<Value>(context, listen: false)
                          .changeHeading('SCIENCE');
                      Content.API(6);
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class NewsCategory extends StatelessWidget {
  NewsCategory(
      {@required this.text, @required this.imageURL, @required this.onPressed});
  String text;
  String imageURL;
  Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Material(
        elevation: 10.0,
        shadowColor: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        child: Container(
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.width * 0.4,
            decoration: BoxDecoration(
              color: AppColors.black,
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
            ),
            child: Column(
              children: <Widget>[
                Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                        color: AppColors.darkGrey,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                        image: DecorationImage(
                            image: NetworkImage(imageURL), fit: BoxFit.cover))),
                SizedBox(
                  height: 10.0,
                ),
                boldText(text: text, color: AppColors.lightWhite, size: 18.0)
              ],
            )),
      ),
    );
  }
}
