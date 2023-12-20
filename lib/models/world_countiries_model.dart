// class WorldCountriesModel {
//   int? updated;
//   String? country;
//   CountryInfo? countryInfo;
//   int? cases;
//   int? todayCases;
//   int? deaths;
//   int? todayDeaths;
//   int? recovered;
//   int? todayRecovered;
//   int? active;
//   int? critical;
//   int? casesPerOneMillion;
//   int? deathsPerOneMillion;
//   int? tests;
//   int? testsPerOneMillion;
//   int? population;
//   String? continent;
//   int? oneCasePerPeople;
//   int? oneDeathPerPeople;
//   int? oneTestPerPeople;
//   double? activePerOneMillion;
//   double? recoveredPerOneMillion;
//   int? criticalPerOneMillion;

//   WorldCountriesModel(
//       {this.updated,
//       this.country,
//       this.countryInfo,
//       this.cases,
//       this.todayCases,
//       this.deaths,
//       this.todayDeaths,
//       this.recovered,
//       this.todayRecovered,
//       this.active,
//       this.critical,
//       this.casesPerOneMillion,
//       this.deathsPerOneMillion,
//       this.tests,
//       this.testsPerOneMillion,
//       this.population,
//       this.continent,
//       this.oneCasePerPeople,
//       this.oneDeathPerPeople,
//       this.oneTestPerPeople,
//       this.activePerOneMillion,
//       this.recoveredPerOneMillion,
//       this.criticalPerOneMillion});
// //changed
// WorldCountriesModel.fromJson(Map<String, dynamic> json) {
//   T? _convert<T>(dynamic value) {
//     if (value is T) {
//       return value;
//     } else if (value is num) {
//       if (T == int) {
//         return value.toInt() as T?;
//       } else if (T == double) {
//         return value.toDouble() as T?;
//       }
//     }
//     return null;
//   }

//   updated = _convert<int>(json['updated']);
//   country = _convert<String>(json['country']);
//   countryInfo = json['countryInfo'] != null
//       ? CountryInfo.fromJson(json['countryInfo'])
//       : null;
//   cases = json['cases']?.toInt();
//   todayCases = json['todayCases']?.toInt();
//   deaths = json['deaths']?.toInt();
//   todayDeaths = json['todayDeaths']?.toInt();
//   recovered = json['recovered']?.toInt();
//   todayRecovered = json['todayRecovered']?.toInt();
//   active = json['active']?.toInt();
//   critical = json['critical']?.toInt();
//   casesPerOneMillion = json['casesPerOneMillion']?.toInt();
//   deathsPerOneMillion = json['deathsPerOneMillion']?.toInt();
//   tests = json['tests']?.toInt();
//   testsPerOneMillion = json['testsPerOneMillion']?.toInt();
//   population = json['population']?.toInt();
//   oneCasePerPeople = json['oneCasePerPeople']?.toInt();
//   oneDeathPerPeople = json['oneDeathPerPeople']?.toInt();
//   oneTestPerPeople = json['oneTestPerPeople']?.toInt();
//   activePerOneMillion = json['activePerOneMillion']?.toDouble();
//   recoveredPerOneMillion = json['recoveredPerOneMillion']?.toDouble();
//   criticalPerOneMillion = json['criticalPerOneMillion']?.toInt();
// }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['updated'] = this.updated;
//     data['country'] = this.country;
//     if (this.countryInfo != null) {
//       data['countryInfo'] = this.countryInfo!.toJson();
//     }
//     data['cases'] = this.cases;
//     data['todayCases'] = this.todayCases;
//     data['deaths'] = this.deaths;
//     data['todayDeaths'] = this.todayDeaths;
//     data['recovered'] = this.recovered;
//     data['todayRecovered'] = this.todayRecovered;
//     data['active'] = this.active;
//     data['critical'] = this.critical;
//     data['casesPerOneMillion'] = this.casesPerOneMillion;
//     data['deathsPerOneMillion'] = this.deathsPerOneMillion;
//     data['tests'] = this.tests;
//     data['testsPerOneMillion'] = this.testsPerOneMillion;
//     data['population'] = this.population;
//     data['continent'] = this.continent;
//     data['oneCasePerPeople'] = this.oneCasePerPeople;
//     data['oneDeathPerPeople'] = this.oneDeathPerPeople;
//     data['oneTestPerPeople'] = this.oneTestPerPeople;
//     data['activePerOneMillion'] = this.activePerOneMillion;
//     data['recoveredPerOneMillion'] = this.recoveredPerOneMillion;
//     data['criticalPerOneMillion'] = this.criticalPerOneMillion;
//     return data;
//   }
// }

// class CountryInfo {
//   int? iId;
//   String? iso2;
//   String? iso3;
//   int? lat;
//   int? long;
//   String? flag;

//   CountryInfo({this.iId, this.iso2, this.iso3, this.lat, this.long, this.flag});

//   CountryInfo.fromJson(Map<String, dynamic> json) {
//     iId = json['_id'];
//     iso2 = json['iso2'];
//     iso3 = json['iso3'];
//     lat = json['lat'];
//     long = json['long'];
//     flag = json['flag'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['_id'] = this.iId;
//     data['iso2'] = this.iso2;
//     data['iso3'] = this.iso3;
//     data['lat'] = this.lat;
//     data['long'] = this.long;
//     data['flag'] = this.flag;
//     return data;
//   }
// }
