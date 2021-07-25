// To parse this JSON data, do
//
//     final topCountriesModel = topCountriesModelFromJson(jsonString);

import 'dart:convert';

List<TopCountriesModel> topCountriesModelFromJson(String str) => List<TopCountriesModel>.from(json.decode(str).map((x) => TopCountriesModel.fromJson(x)));

String topCountriesModelToJson(List<TopCountriesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TopCountriesModel {
    TopCountriesModel({
        this.updated,
        this.country,
        this.countryInfo,
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
        this.continent,
        this.oneCasePerPeople,
        this.oneDeathPerPeople,
        this.oneTestPerPeople,
        this.activePerOneMillion,
        this.recoveredPerOneMillion,
        this.criticalPerOneMillion,
    });

    final int? updated;
    final String? country;
    final CountryInfo? countryInfo;
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
    final int? testsPerOneMillion;
    final int? population;
    final Continent? continent;
    final int? oneCasePerPeople;
    final int? oneDeathPerPeople;
    final int? oneTestPerPeople;
    final double? activePerOneMillion;
    final double? recoveredPerOneMillion;
    final double? criticalPerOneMillion;

    factory TopCountriesModel.fromJson(Map<String, dynamic> json) => TopCountriesModel(
        updated: json["updated"] == null ? null : json["updated"],
        country: json["country"] == null ? null : json["country"],
        countryInfo: json["countryInfo"] == null ? null : CountryInfo.fromJson(json["countryInfo"]),
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
        testsPerOneMillion: json["testsPerOneMillion"] == null ? null : json["testsPerOneMillion"],
        population: json["population"] == null ? null : json["population"],
        oneCasePerPeople: json["oneCasePerPeople"] == null ? null : json["oneCasePerPeople"],
        oneDeathPerPeople: json["oneDeathPerPeople"] == null ? null : json["oneDeathPerPeople"],
        oneTestPerPeople: json["oneTestPerPeople"] == null ? null : json["oneTestPerPeople"],
        activePerOneMillion: json["activePerOneMillion"] == null ? null : json["activePerOneMillion"].toDouble(),
        recoveredPerOneMillion: json["recoveredPerOneMillion"] == null ? null : json["recoveredPerOneMillion"].toDouble(),
        criticalPerOneMillion: json["criticalPerOneMillion"] == null ? null : json["criticalPerOneMillion"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "updated": updated == null ? null : updated,
        "country": country == null ? null : country,
        "countryInfo": countryInfo == null ? null : countryInfo!.toJson(),
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
    };
}

enum Continent { NORTH_AMERICA, ASIA, SOUTH_AMERICA, EUROPE, AFRICA, AUSTRALIA_OCEANIA, EMPTY }



class CountryInfo {
    CountryInfo({
        this.id,
        this.iso2,
        this.iso3,
        this.lat,
        this.long,
        this.flag,
    });

    final int? id;
    final String? iso2;
    final String? iso3;
    final double? lat;
    final double? long;
    final String? flag;

    factory CountryInfo.fromJson(Map<String, dynamic> json) => CountryInfo(
        id: json["_id"] == null ? null : json["_id"],
        iso2: json["iso2"] == null ? null : json["iso2"],
        iso3: json["iso3"] == null ? null : json["iso3"],
        lat: json["lat"] == null ? null : json["lat"].toDouble(),
        long: json["long"] == null ? null : json["long"].toDouble(),
        flag: json["flag"] == null ? null : json["flag"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "iso2": iso2 == null ? null : iso2,
        "iso3": iso3 == null ? null : iso3,
        "lat": lat == null ? null : lat,
        "long": long == null ? null : long,
        "flag": flag == null ? null : flag,
    };
}

