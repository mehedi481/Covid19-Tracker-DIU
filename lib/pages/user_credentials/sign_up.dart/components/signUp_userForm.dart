import 'package:covid_19_tracker/helpers/constants/constants.dart';
import 'package:covid_19_tracker/helpers/size_config/size_config.dart';
import 'package:covid_19_tracker/pages/user_credentials/sign_in.dart/log_in_page.dart';
import 'package:flutter/material.dart';

//ignore: must_be_immutable
class SignUpUserForm extends StatelessWidget {
  SignUpUserForm({Key? key, @required this.formKey}) : super(key: key);
  final formKey;
  String _name = '';
  String _password = '';
  String _email = '';

  void validateFormField() {
    final form = formKey.currentState;
    if (form!.validate()) {
      print("Form valid");
      print(_name + _email + _password);
    } else {
      print("Form Invalid");
    }
  }

  String? validateEmail(String email) {
    if (!emailPhoneValidatorRegExp.hasMatch(email)) {
      return "Enter a valid email address";
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
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
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  hintText: "Enter your FullName",
                ),
                validator: (value) => value!.isEmpty ? "Name Required" : null,
                onChanged: (value) {
                  _name = value;
                },
              ),
              SizedBox(height: 25),
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  hintText: "Enter your Email",
                ),
                validator: (value) => validateEmail(value!),
                onChanged: (value) {
                  _email = value;
                },
              ),
              SizedBox(height: 25),
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  hintText: "Enter your Password",
                ),
                validator: (value) =>
                    value!.isEmpty ? "Password Required" : null,
                onChanged: (value) {
                  _password = value;
                },
              ),
              SizedBox(height: 35),
              Column(
                children: [
                  Center(
                    child: SizedBox(
                      width: ScreenSize.width * 0.5,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.blue,
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        onPressed: () {
                          validateFormField();
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
