import 'package:flutter/material.dart';
import 'package:miras/model/constants/blog_texts.dart';
import 'package:miras/model/constants/constants.dart';
import 'package:miras/view/widgets/icon_badge.dart';
import 'package:miras/view/widgets/search_bar.dart';
import 'package:miras/view/widgets/vertical_items.dart';

class BlogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: Text("Miras Hukuku Veri Bankası") ,
        actions: <Widget>[
          IconButton(
            icon: IconBadge(
              icon: Icons.account_balance,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "Ne aramıştınız?",
              style: TextStyle(
                color: AppColors.mainColor,
                fontSize: 30.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: SearchBar(),
          ),
          buildVerticalList(),
        ],
      ),
    );
  }


  buildVerticalList() {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: ListView.builder(
        primary: false,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: blogTexts == null ? 0 : blogTexts.length,
        itemBuilder: (BuildContext context, int index) {
          Map blogText = blogTexts[index];
          return VerticalPlaceItem(blogTexts: blogText);
        },
      ),
    );
  }
}