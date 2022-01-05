import 'package:flutter/material.dart';
import 'package:newz/Backend/fetchNews.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newz/Utils/Colors.dart';

class searchBar extends StatefulWidget {
  const searchBar({Key key}) : super(key: key);
  static TextEditingController searchcontroller =
      TextEditingController(text: '');
  @override
  _searchBarState createState() => _searchBarState();
}

class _searchBarState extends State<searchBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 50,
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
              color: AppColors.darkGrey,
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: searchBar.searchcontroller,
                    decoration: InputDecoration(
                        hintText: 'Search a keyword or a phrase',
                        hintStyle: GoogleFonts.lato(),
                        border: InputBorder.none),
                  ),
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            FocusScope.of(context).unfocus();
            fetchNews();
          },
          child: Container(
            width: 45,
            height: 50,
            decoration: BoxDecoration(
                color: AppColors.darkGrey, shape: BoxShape.circle),
            child: Icon(
              Icons.search,
              color: AppColors.white,
            ),
          ),
        )
      ],
    );
  }
}
