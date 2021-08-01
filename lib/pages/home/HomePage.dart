import 'package:covid_19_tracker/api/api.dart';
import 'package:covid_19_tracker/data/data_source.dart';
import 'package:covid_19_tracker/model/bangladesh_model.dart';
import 'package:covid_19_tracker/model/worldWide_model.dart';
import 'package:covid_19_tracker/pages/user_credentials/welcomePage.dart';
import 'package:covid_19_tracker/pages/widgets/aboutMe.dart';
import 'package:covid_19_tracker/pages/widgets/all_Countries.dart';
import 'package:covid_19_tracker/pages/widgets/bangladesh.dart';
import 'package:covid_19_tracker/pages/widgets/info_pannel.dart';
import 'package:covid_19_tracker/pages/widgets/pie_Chart_worldwide.dart';
import 'package:covid_19_tracker/pages/widgets/top_list.dart';
import 'package:covid_19_tracker/pages/widgets/worldwide.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  // Pull to Refresh function
  Future<void> fetchData() async {
    API.getBangladeshData();
    API.getTopCountriesData();
    API.getWorldWideData();
    API.getAllCountriesData();
    await Future.delayed(Duration(seconds: 2));
  }

  // Back Button Press Handling
  Future<bool> _onBackPressed() async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Do you really want to Close the app ?"),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            child: Text("Yes"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context, false);
            },
            child: Text("No"),
          ),
        ],
      ),
    );
  }

  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => WelcomePage()),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("COVID-19 TRACKER"),
        centerTitle: false,
        actions: [
          IconButton(
              icon: Icon(
                Icons.info,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AboutMe()));
              }),
          IconButton(
              onPressed: () {
                logOut();
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: WillPopScope(
        onWillPop: _onBackPressed,
        child: RefreshIndicator(
          onRefresh: fetchData,
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 55,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.orange[100],
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "You will get Update Worldwide every 10 minutes. For Update Please Pull to Refresh.",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange[800],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 10,
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Your Selected Country :",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AllCountry()));
                            },
                            child: Container(
                              padding: const EdgeInsets.all(3.5),
                              decoration: BoxDecoration(
                                color: primaryBlack,
                                borderRadius: BorderRadius.circular(3.0),
                              ),
                              child: Text(
                                "All List",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ]),
                  ),

                  Consumer<BangladeshDataModel?>(
                    builder: (context, bdData, child) {
                      return bdData!.active == null
                          ? Center(child: CircularProgressIndicator())
                          : Bangladesh(
                              bangladeshDataModel: bdData,
                            );
                    },
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Worldwide :",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TopList(),
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(3.5),
                            decoration: BoxDecoration(
                              color: primaryBlack,
                              borderRadius: BorderRadius.circular(3.0),
                            ),
                            child: Text(
                              "Top Listed",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Consumer<WorldwideDataModel?>(
                    builder: (context, worldData, child) {
                      return worldData!.updated == null
                          ? Center(child: CircularProgressIndicator())
                          : Worldwide(
                              worldwideDataModel: worldData,
                            );
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // This is for Pie
                  Consumer<WorldwideDataModel?>(
                    builder: (context, worldDataPie, child) {
                      return worldDataPie!.updated == null
                          ? Center(child: CircularProgressIndicator())
                          : PieChartWorldwide(
                              worldwideDataModelPie: worldDataPie);
                    },
                  ),

                  SizedBox(
                    height: 15,
                  ),

                  /// Info Pannel Page
                  InfoPannel(),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Developed by Mehedi Hasan",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: primaryBlack,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
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
