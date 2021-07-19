// To parse this JSON data, do
//
//     final worldwideDataModel = worldwideDataModelFromMap(jsonString);

import 'dart:convert';

WorldwideDataModel worldwideDataModelFromMap(String str) => WorldwideDataModel.fromMap(json.decode(str));

String worldwideDataModelToMap(WorldwideDataModel data) => json.encode(data.toMap());

class WorldwideDataModel {
    WorldwideDataModel({
        this.updated,
        this.cases,
        this.todayCases,
        this.deaths,
        this.todayDeaths,
        this.recovered,
        this.todayRecovered,
        this.active,
        this.critical,
        this.casesPerOneMillion,
        this.deathsPerOneMillion,
        this.tests,
        this.testsPerOneMillion,
        this.population,
        this.oneCasePerPeople,
        this.oneDeathPerPeople,
        this.oneTestPerPeople,
        this.activePerOneMillion,
        this.recoveredPerOneMillion,
        this.criticalPerOneMillion,
        this.affectedCountries,
       
    });

    final int? updated;
    final int? cases;
    final int? todayCases;
    final int? deaths;
    final int? todayDeaths;
    final int? recovered;
    final int? todayRecovered;
    final int? active;
    final int? critical;
    final int? casesPerOneMillion;
    final double? deathsPerOneMillion;
    final int? tests;
    final double? testsPerOneMillion;
    final int? population;
    final int? oneCasePerPeople;
    final int? oneDeathPerPeople;
    final int? oneTestPerPeople;
    final double? activePerOneMillion;
    final double? recoveredPerOneMillion;
    final double? criticalPerOneMillion;
    final int? affectedCountries;
  

    factory WorldwideDataModel.fromMap(Map<String, dynamic> json) => WorldwideDataModel(
        updated: json["updated"] == null ? null : json["updated"],
        cases: json["cases"] == null ? null : json["cases"],
        todayCases: json["todayCases"] == null ? null : json["todayCases"],
        deaths: json["deaths"] == null ? null : json["deaths"],
        todayDeaths: json["todayDeaths"] == null ? null : json["todayDeaths"],
        recovered: json["recovered"] == null ? null : json["recovered"],
        todayRecovered: json["todayRecovered"] == null ? null : json["todayRecovered"],
        active: json["active"] == null ? null : json["active"],
        critical: json["critical"] == null ? null : json["critical"],
        casesPerOneMillion: json["casesPerOneMillion"] == null ? null : json["casesPerOneMillion"],
        deathsPerOneMillion: json["deathsPerOneMillion"] == null ? null : json["deathsPerOneMillion"].toDouble(),
        tests: json["tests"] == null ? null : json["tests"],
        testsPerOneMillion: json["testsPerOneMillion"] == null ? null : json["testsPerOneMillion"].toDouble(),
        population: json["population"] == null ? null : json["population"],
        oneCasePerPeople: json["oneCasePerPeople"] == null ? null : json["oneCasePerPeople"],
        oneDeathPerPeople: json["oneDeathPerPeople"] == null ? null : json["oneDeathPerPeople"],
        oneTestPerPeople: json["oneTestPerPeople"] == null ? null : json["oneTestPerPeople"],
        activePerOneMillion: json["activePerOneMillion"] == null ? null : json["activePerOneMillion"].toDouble(),
        recoveredPerOneMillion: json["recoveredPerOneMillion"] == null ? null : json["recoveredPerOneMillion"].toDouble(),
        criticalPerOneMillion: json["criticalPerOneMillion"] == null ? null : json["criticalPerOneMillion"].toDouble(),
        affectedCountries: json["affectedCountries"] == null ? null : json["affectedCountries"],
        
    );

    Map<String, dynamic> toMap() => {
        "updated": updated == null ? null : updated,
        "cases": cases == null ? null : cases,
        "todayCases": todayCases == null ? null : todayCases,
        "deaths": deaths == null ? null : deaths,
        "todayDeaths": todayDeaths == null ? null : todayDeaths,
        "recovered": recovered == null ? null : recovered,
        "todayRecovered": todayRecovered == null ? null : todayRecovered,
        "active": active == null ? null : active,
        "critical": critical == null ? null : critical,
        "casesPerOneMillion": casesPerOneMillion == null ? null : casesPerOneMillion,
        "deathsPerOneMillion": deathsPerOneMillion == null ? null : deathsPerOneMillion,
        "tests": tests == null ? null : tests,
        "testsPerOneMillion": testsPerOneMillion == null ? null : testsPerOneMillion,
        "population": population == null ? null : population,
        "oneCasePerPeople": oneCasePerPeople == null ? null : oneCasePerPeople,
        "oneDeathPerPeople": oneDeathPerPeople == null ? null : oneDeathPerPeople,
        "oneTestPerPeople": oneTestPerPeople == null ? null : oneTestPerPeople,
        "activePerOneMillion": activePerOneMillion == null ? null : activePerOneMillion,
        "recoveredPerOneMillion": recoveredPerOneMillion == null ? null : recoveredPerOneMillion,
        "criticalPerOneMillion": criticalPerOneMillion == null ? null : criticalPerOneMillion,
        "affectedCountries": affectedCountries == null ? null : affectedCountries,
        
    };
}
