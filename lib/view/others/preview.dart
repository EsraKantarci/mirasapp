//dilekçeler için layout
// download feature will be added: https://www.youtube.com/watch?v=ardrERpmQDA

import 'package:flutter/material.dart';
import 'package:miras/model/constants/constants.dart';
import 'package:miras/view/home_page.dart';
import 'package:miras/view/others/blog.dart';
import 'package:miras/view/start_page.dart';

import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';
import 'package:miras/controller/global_state.dart';
import 'package:miras/controller/rank_calculator.dart';
import 'package:miras/model/constants/constants.dart';
import 'package:miras/view/start_page.dart';

class Preview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: (<Widget>[
            Expanded(
              flex: 16,
              child: buildImage(context),
            ),
          ]),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: AppColors.mainColor,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BlogPage()),
                );
              },
            ),
            SizedBox(width: 48.0),
            IconButton(
              icon: Icon(
                Icons.home,
                color: AppColors.mainColor,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.mainColor,
        child: Icon(Icons.save),
        onPressed: () {
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('Bilgi Penceresi:'),
              content: const Text(
                  'Henüz telefona kaydetme özelliği uygulamamıza eklenmedi.  Ancak isterseniz ekran görüntüsü alabilirsiniz. İlginiz için teşekkür ederiz.'),
              actions: <Widget>[

                TextButton(
                  onPressed: () => Navigator.pop(context, 'Anladım'),
                  child: const Text('Anladım', style: TextStyle(color: Colors.deepPurple, fontSize: 20, fontWeight: FontWeight.bold),),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text("Vasiyetname"),
      backgroundColor: AppColors.mainColor,
      actions: <Widget>[
        IconButton(
          icon: Icon(
            //Step: 1
            Icons.looks_one,
            color: Colors.white,
          ),
          onPressed: () {
            //maybe toasting "Adım: 1'desiniz" is a good idea.
          },
        )
      ],
    );
  }
}

Widget buildImage(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 5),
    child: Align(
        alignment: Alignment.center,
        child: Image.asset("assets/images/vasiyet.png", fit: BoxFit.fitWidth)),
  );
}
