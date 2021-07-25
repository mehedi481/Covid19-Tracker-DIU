import 'package:covid_19_tracker/api/api.dart';
import 'package:covid_19_tracker/model/allCountries_model.dart';
import 'package:covid_19_tracker/model/bangladesh_model.dart';
import 'package:covid_19_tracker/model/topCountries_model.dart';
import 'package:covid_19_tracker/pages/widgets/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data/data_source.dart';
import 'model/worldWide_model.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    // provider for state management & api calling
    return MultiProvider(
      providers: [
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
