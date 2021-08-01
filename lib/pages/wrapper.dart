import 'package:covid_19_tracker/helpers/size_config/size_config.dart';
import 'package:covid_19_tracker/pages/home/HomePage.dart';
import 'package:covid_19_tracker/pages/user_credentials/welcomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var auth = Provider.of<User?>(context);
    ScreenSize().init(context);

    return auth != null ? HomePage() : WelcomePage();
  }
}
