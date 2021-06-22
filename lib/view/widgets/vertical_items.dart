import 'package:flutter/material.dart';
import 'package:miras/model/constants/blog_texts.dart';
import 'package:miras/model/constants/constants.dart';
import 'package:miras/view/others/blog.dart';
import 'package:miras/view/others/details.dart';


class VerticalPlaceItem extends StatelessWidget {
  final Map blogTexts;

  VerticalPlaceItem({this.blogTexts});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: InkWell(
        child: Container(
          //color: Colors.white.withOpacity(0.4),
          height: MediaQuery.of(context).size.height*0.1,
          child: Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  "${blogTexts["img"]}",
                  height: 70.0,
                  width: 70.0,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 15.0),
              Expanded(
                child: ListView(
                  primary: false,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "${blogTexts["name"]}",
                        style: TextStyle(
                          color: AppColors.mainColor.withOpacity(0.8),
                          fontWeight: FontWeight.w700,
                          fontSize: 14.0,
                        ),
                        maxLines: 2,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(height: 3.0),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.location_on,
                          size: 13.0,
                          color: Colors.blueGrey[300],
                        ),
                        SizedBox(width: 3.0),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "${blogTexts["trailing"]}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13.0,
                              color: Colors.blueGrey[300],
                            ),
                            maxLines: 1,
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return Details();
              },
            ),
          );
        },
      ),
    );
  }
}