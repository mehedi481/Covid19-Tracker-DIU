import 'package:connectivity/connectivity.dart';
import 'package:covid_19_tracker/components/image_path.dart';
import 'package:covid_19_tracker/data/data_source.dart';
import 'package:covid_19_tracker/helpers/size_config/size_config.dart';
import 'package:covid_19_tracker/pages/home/HomePage.dart';
import 'package:covid_19_tracker/pages/user_credentials/sign_in.dart/log_in_page.dart';
import 'package:covid_19_tracker/pages/user_credentials/sign_up.dart/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  var connectionStatus;

  Future<bool> _onBackPressed() async {
    return await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text("Do you really want to Close the app ?"),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  child: Text("Yes")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: Text("No")),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    connectionStatus = Provider.of<ConnectivityResult?>(context);
    return Scaffold(
      backgroundColor: primaryBlack,
      body: WillPopScope(
        onWillPop: _onBackPressed,
        child: SafeArea(
          child: Column(
            children: [
              Spacer(),
              Flexible(
                flex: 2,
                child: Container(
                  child: SizedBox(
                    height: getProportionateScreenHeight(150),
                    width: getProportionateScreenWidth(150),
                    child:
                        Hero(tag: "logo", child: Image.asset(ImagePath.logo)),
                  ),
                ),
              ),
              Spacer(),
              Flexible(
                flex: 5,
                child: Container(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "COVID-19 TRACKER",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(26),
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                        SizedBox(height: 15),
                        Column(
                          children: [
                            Text(
                              "Covid19 Tracker is an informational application",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: getProportionateScreenWidth(16),
                              ),
                            ),
                            Text(
                              "You can get everyday covid19 updates.",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: getProportionateScreenWidth(16),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 15),
                        button(
                          name: "Login",
                          bgColor: Colors.green,
                          textColor: Colors.white,
                          onPressed: () {
                            if (connectionStatus != ConnectivityResult.none) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginPage(),
                                  ));
                            } else {
                              ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar();
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                duration: Duration(seconds: 2),
                                content: Text(
                                  "You are Offline.Please make sure your internet Connection.",
                                  style: TextStyle(fontSize: 15),
                                ),
                                backgroundColor: Colors.red,
                              ));
                            }
                          },
                        ),
                        SizedBox(height: 10),
                        button(
                          name: "SignUp",
                          bgColor: Colors.white,
                          textColor: Colors.green,
                          onPressed: () {
                            if (connectionStatus != ConnectivityResult.none) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignUpPage(),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar();
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                duration: Duration(seconds: 2),
                                content: Text(
                                  "You are Offline.Please make sure your internet Connection.",
                                  style: TextStyle(fontSize: 15),
                                ),
                                backgroundColor: Colors.red,
                              ));
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Spacer(),
              Flexible(
                flex: 1,
                child: connectionStatus != ConnectivityResult.none
                    ? InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ),
                          );
                        },
                        child: Text(
                          "Skip this Page",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: getProportionateScreenWidth(18),
                              decoration: TextDecoration.underline),
                        ),
                      )
                    : Text(
                        "You are Offline",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget button(
    {@required name,
    @required bgColor,
    @required textColor,
    @required onPressed}) {
  return Padding(
    padding: const EdgeInsets.only(
      left: 20.0,
      right: 20,
    ),
    child: Container(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        child: Text(
          name,
          style: TextStyle(color: textColor),
        ),
        onPressed: onPressed,
        style: ButtonStyle(
          side: MaterialStateProperty.all<BorderSide>(
            BorderSide(
              color: Colors.green,
              width: 2,
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(
            bgColor,
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
      ),
    ),
  );
}
