import 'dart:async';

import 'package:covid_19_tracker/model/bangladesh_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class Bangladesh extends StatelessWidget {
  final BangladeshDataModel? bangladeshDataModel;
 

  const Bangladesh({Key? key,@required this.bangladeshDataModel}) : super(key: key);
  // Map bangladeshData;
  // Bangladesh({required this.bangladeshData});
  @override
  Widget build(BuildContext context) {
    // var _bdDataProvider = Provider.of<BangladeshDataModel?>(context);
    return Container(
      padding:
          const EdgeInsets.only(left: 10.0, bottom: 10.0, right: 10.0, top: 5),
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
                    "Bangladesh",
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
                    // bangladeshData["countryInfo"]['flag'],
                    bangladeshDataModel!.countryInfo!.flag!,
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
                  // "CONFIRMED : " + bangladeshData['cases'].toString(),
                  "CONFIRMED " + bangladeshDataModel!.cases.toString(),
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.red[800]),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  // "ACTIVE : " + bangladeshData['active'].toString(),
                  "ACTIVE : " + bangladeshDataModel!.active.toString(),
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[800]),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  // "RECOVERED : " + bangladeshData['recovered'].toString(),
                  "RECOVERED : " + bangladeshDataModel!.recovered.toString(),
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[800]),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  // "TODAY DEATHS : " + bangladeshData['todayDeaths'].toString(),
                  "TODAY DEATHS : " + bangladeshDataModel!.todayDeaths.toString(),
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.red[900]),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  // "TOTAL DEATHS : " + bangladeshData['deaths'].toString(),
                  "TOTAL DEATHS : " + bangladeshDataModel!.deaths.toString(),
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
