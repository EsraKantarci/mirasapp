//ref: https://github.com/AbhishekDoshi26/contactus/

import 'package:flutter/material.dart';
import 'package:miras/model/constants/constants.dart';
import 'package:miras/view/widgets/contact_us.dart';

void main() => runApp(ContactPage());

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: ContactUsBottomAppBar(
          companyName: 'Esra Kantarcı Çayır',
          textColor: Colors.white,
          backgroundColor: AppColors.mainColor,
          email: 'av.esrakantarci@gmail.com',
          textFont: 'Ubuntu',
          fontSize: 15,
        ),
        backgroundColor: AppColors.backgroundColor,
        body: ContactUs(
          taglineFont: "Ubuntu",
            cardColor: Colors.white,
            textColor: AppColors.mainColor,
            logo: AssetImage('assets/images/esra.jpg'),
            email: 'av.esrakantarci@gmail.com',
            companyName: 'Esra Kantarcı Çayır',
            companyColor: AppColors.mainColor,
            phoneNumber: '+905076576321',
            website: 'https://github.com/esrakantarci',
            githubUserName: 'EsraKantarci',
            linkedinURL:
                'https://tr.linkedin.com/in/esra-kantarc%C4%B1-%C3%A7ay%C4%B1r-b1948454/',
            tagLine: 'Avukat & Bilgisayar Mühendisi',
            taglineColor: AppColors.mainColor.withOpacity(0.8),
            instagram: 'ornitorenkus',
            youtubeHandle: 'UC6LRIOoew_kfit3qeYp1QYA'),
      ),
    );
  }
}
