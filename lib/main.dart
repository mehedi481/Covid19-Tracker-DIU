import 'package:covid_19_tracker/api/api.dart';
import 'package:covid_19_tracker/model/allCountries_model.dart';
import 'package:covid_19_tracker/model/bangladesh_model.dart';
import 'package:covid_19_tracker/model/topCountries_model.dart';
import 'package:covid_19_tracker/pages/widgets/splash_screen.dart';
import 'package:covid_19_tracker/services/userData.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data/data_source.dart';
import 'model/worldWide_model.dart';
import 'package:connectivity/connectivity.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    // provider for state management & api calling
    return MultiProvider(
      providers: [
        //Check Connection Status
        StreamProvider<ConnectivityResult?>(
          initialData: ConnectivityResult.none,
          create: (BuildContext context) =>
              Connectivity().onConnectivityChanged,
        ),
        // Check user
        StreamProvider<User?>(
          create: (context) => FirebaseAuth.instance.authStateChanges(),
          initialData: null,
        ),
        // UserName
        FutureProvider<String?>(
          create: (_) => UserData.getUserName(),
          initialData: "No User",
        ),
        FutureProvider<BangladeshDataModel?>(
          initialData: BangladeshDataModel(),
          create: (context) => API.getBangladeshData(),
          catchError: (context, error) {
            debugPrint("$error");
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("$error"),
                backgroundColor: Colors.red,
              ),
            );
          },
        ),
        FutureProvider<WorldwideDataModel?>(
          initialData: WorldwideDataModel(),
          create: (context) => API.getWorldWideData(),
          catchError: (context, error) {
            debugPrint("$error");
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("$error"),
                backgroundColor: Colors.red,
              ),
            );
          },
        ),
        FutureProvider<List<AllCountriesModel>?>(
          initialData: null,
          create: (context) => API.getAllCountriesData(),
          catchError: (context, error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("$error"),
                backgroundColor: Colors.red,
              ),
            );
          },
        ),
        FutureProvider<List<TopCountriesModel>?>(
          initialData: null,
          create: (context) => API.getTopCountriesData(),
          catchError: (context, error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("$error"),
                backgroundColor: Colors.red,
              ),
            );
          },
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Circular',
          primaryColor: primaryBlack,
        ),
        title: "Covid-19",
        home: SplashScreen(),
      ),
    );
  }
}
