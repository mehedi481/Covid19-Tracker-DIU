import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AllCountry extends StatelessWidget {
  List allCountryData;
  AllCountry({required this.allCountryData});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Countries"),
      ),
      body: allCountryData == null
          ? Center(
              child: Column(
                children: [
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Please make sure your internet connection !",
                    style: TextStyle(color: Colors.red[400]),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: allCountryData.length,
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
                                allCountryData[index]["country"],
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
                                allCountryData[index]["countryInfo"]['flag'],
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
                                  allCountryData[index]['cases'].toString(),
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
                                  allCountryData[index]['active'].toString(),
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
                                  allCountryData[index]['recovered'].toString(),
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
                                  allCountryData[index]['todayDeaths']
                                      .toString(),
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
                                  allCountryData[index]['deaths'].toString(),
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
