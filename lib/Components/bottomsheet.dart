import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newz/Utils/Text.dart';
import 'package:url_launcher/url_launcher.dart';

void showMyBottomSheet(
    BuildContext context, String title, String description, imageUrl, url) {
  showBottomSheet(
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0))),
      elevation: 20.0,
      context: context,
      builder: (context) {
        return MyBottomSheetLayout(
          url: url,
          imageUrl: imageUrl,
          title: title,
          description: description,
        );
      });
}

launchUrl(String Url) async {
  await launch(Url);
}

class MyBottomSheetLayout extends StatelessWidget {
  MyBottomSheetLayout(
      {@required this.imageUrl,
      @required this.description,
      @required this.title,
      @required this.url});
  final String url, title, description, imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          BottomSheetImage(imageUrl: imageUrl, title: title),
          Container(
            padding: EdgeInsets.all(10.0),
            child:
                modifiedText(text: description, color: Colors.white, size: 16),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
                launchUrl(url);
              },
              child: RichText(
                text: TextSpan(children: <TextSpan>[
                  TextSpan(
                    text: 'Read Full Article',
                    // recognizer: TapGestureRecognizer()
                    //   ..onTap = () {
                    //
                    //   },
                    style: GoogleFonts.lato(color: Colors.blue.shade400),
                  )
                ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BottomSheetImage extends StatelessWidget {
  BottomSheetImage({@required this.title, @required this.imageUrl});
  final String imageUrl, title;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.30,
        child: Stack(
          children: [
            Container(
              foregroundDecoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.black, Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
                image: DecorationImage(
                    image: NetworkImage(imageUrl), fit: BoxFit.cover),
              ),
            ),
            Positioned(
                bottom: 10,
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  width: 300,
                  child: boldText(text: title, color: Colors.white, size: 18),
                ))
          ],
        ));
  }
}
