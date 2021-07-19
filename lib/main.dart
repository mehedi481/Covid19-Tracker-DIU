import 'package:covid_19_tracker/api/api.dart';
import 'package:covid_19_tracker/model/bangladesh_model.dart';
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
    return MultiProvider(
      providers: [
        FutureProvider<BangladeshDataModel?>(
          initialData: BangladeshDataModel(),
          create: (context) => API.getBangladeshData(),
          catchError: (context, error) {
            debugPrint("$error");
          },
        ),
        FutureProvider<WorldwideDataModel?>(
          initialData: WorldwideDataModel(),
          create: (context) => API.getWorldWideData(),
          catchError: (context,error){
            debugPrint("$error");
          },
        )
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
