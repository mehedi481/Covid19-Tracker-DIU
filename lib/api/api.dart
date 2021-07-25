import 'package:covid_19_tracker/model/bangladesh_model.dart';
import 'package:covid_19_tracker/model/topCountries_model.dart';
import 'package:covid_19_tracker/model/worldWide_model.dart';
import 'package:http/http.dart' as http;

class API {
  ///////////////// Bangladesh /////////////////////////
  static Future<BangladeshDataModel?> getBangladeshData() async {
    var request = http.Request('GET',
        Uri.parse('https://disease.sh/v3/covid-19/countries/bangladesh'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var body = await response.stream.bytesToString();
      print(body);
      var bangladeshData = bangladeshDataModelFromJson(body);
      return bangladeshData;
    } else {
      print(response.reasonPhrase);
    }
  }

  //////////////// World Wide ///////////////////////
  static Future<WorldwideDataModel?> getWorldWideData() async {
    var request =
        http.Request('GET', Uri.parse('https://disease.sh/v3/covid-19/all'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // print(await response.stream.bytesToString());  // Note that: Don't use await inside of print/debugPrint
      var body = await response.stream.bytesToString();
      print(body);
      var worldwideData = worldwideDataModelFromMap(body);
      return worldwideData;
    } else {
      print(response.reasonPhrase);
    }
  }


  ///////////////////// Top Countries /////////////////////
  static Future<List<TopCountriesModel>?> getTopCountriesData() async {
    var request = http.Request('GET',
        Uri.parse('https://disease.sh/v3/covid-19/countries?sort=cases'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var body  = await response.stream.bytesToString();
      print("Top Countries Data");
      print(body);
      var topCountriesData = topCountriesModelFromJson(body);
      return topCountriesData;
    } else {
      print(response.reasonPhrase);
    }
  }
}
