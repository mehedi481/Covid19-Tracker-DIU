import 'package:covid_19_tracker/model/topCountries_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class TopList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var topListData = Provider.of<List<TopCountriesModel>?>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Top 10 Effected Countries"),
      ),
      body: topListData == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.only(
                    left: 10.0,
                    bottom: 10.0,
                    right: 10.0,
                    top: 5,
                  ),
                  height: 120,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 20,
                              child: Text(
                                // topListData[index]["country"],
                                topListData[index].country!,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: 75,
                              width: double.infinity,
                              child: Image.network(
                                // topListData[index]["countryInfo"]['flag'],
                                topListData[index].countryInfo!.flag!,
                                height: 70,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 7),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "CONFIRMED : " +
                                  // topListData[index]['cases'].toString(),
                                  topListData[index].cases.toString(),
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.red[800],
                              ),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              "ACTIVE : " +
                                  // topListData[index]['active'].toString(),
                                  topListData[index].active.toString(),
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue[800],
                              ),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              "RECOVERED : " +
                                  // topListData[index]['recovered'].toString(),
                                  topListData[index].recovered.toString(),
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.green[800],
                              ),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              "TODAY DEATHS : " +
                                  // topListData[index]['todayDeaths'].toString(),
                                  topListData[index].todayDeaths.toString(),
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.red[900],
                              ),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              "TOTAL DEATHS : " +
                                  // topListData[index]['deaths'].toString(),
                                 topListData[index].deaths.toString(),
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[800],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
    );
  }
}
