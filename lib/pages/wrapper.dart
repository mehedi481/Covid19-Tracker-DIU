import 'package:covid_19_tracker/helpers/size_config/size_config.dart';
import 'package:covid_19_tracker/pages/user_credentials/welcomePage.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return WelcomePage();
  }
}
