import 'package:covid_19_tracker/data/data_source.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutMe extends StatelessWidget {
  void _launchURL(url)async{
    if(await canLaunch(url)){
      await launch(url);
    }
    else{
      print("Url launch Problem");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[100],
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "Information",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: Text(
                "If you face any kind of problem,issus.Please Contact with us.We can Solve ASAP.Thank You for using this App.Stay Home Safe life.",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 6,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(primaryBlack),
              ),
              onPressed: (){
                _launchURL(
                  "mailto:mehedihasan.cse.info@gmail.com?subject=From Covid-19 App&body=");
              }, child: Text("Contact With Us",style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),)),
          ],
        ),
      ),
    );
  }
}
