import 'package:covid_19_tracker/helpers/constants/constants.dart';
import 'package:covid_19_tracker/helpers/size_config/size_config.dart';
import 'package:covid_19_tracker/pages/user_credentials/sign_in.dart/log_in_page.dart';
import 'package:covid_19_tracker/services/auth.dart';
import 'package:flutter/material.dart';

class SignUpUserForm extends StatefulWidget {
  @override
  _SignUpUserFormState createState() => _SignUpUserFormState();
}

class _SignUpUserFormState extends State<SignUpUserForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  String? name;
  String? email;
  String? password;

  void validateFormField() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      print("Form valid");
      print("email: " + email!);
      print("name " + name!);
      print(password! + " password");
      // Create User
      Auth.createUser(context, name!, email!, password!);
      // setState(() {
      //   isLoading = false;
      // });
    } else {
      print("Form Invalid");
    }
  }

  String? validateEmail(String email) {
    if (!emailPhoneValidatorRegExp.hasMatch(email)) {
      // setState(() {
      //   isLoading = false;
      // });
      return "Enter a valid email address";
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: crossStart,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 20),
              Text(
                "Sign Up",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(25),
                  fontWeight: FontWeight.w500,
                  letterSpacing: 2,
                ),
              ),
              SizedBox(height: 35),
              TextFormField(
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  hintText: "Enter your FullName",
                ),
                validator: (value) => value!.isEmpty ? "Name Required" : null,
                onChanged: (value) {
                  name = value;
                },
              ),
              SizedBox(height: 25),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  hintText: "Enter your Email",
                ),
                validator: (value) => validateEmail(value!),
                onChanged: (value) {
                  email = value;
                },
              ),
              SizedBox(height: 25),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  hintText: "Enter your Password",
                ),
                validator: (value) =>
                    value!.isEmpty ? "Password Required" : null,
                onChanged: (value) {
                  password = value;
                },
              ),
              SizedBox(height: 35),
              Column(
                children: [
                  Center(
                    child: SizedBox(
                      width: ScreenSize.width * 0.5,
                      child: isLoading == true
                          ? Center(child: CircularProgressIndicator())
                          : ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  Colors.blue,
                                ),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  isLoading = true;
                                });
                                validateFormField();
                                Future.delayed(Duration(milliseconds: 1500))
                                    .whenComplete(
                                  () => setState(() {
                                    isLoading = false;
                                  }),
                                );
                              },
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.5,
                                    fontFamily: "roboto"),
                              ),
                            ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have ?",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 10),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
