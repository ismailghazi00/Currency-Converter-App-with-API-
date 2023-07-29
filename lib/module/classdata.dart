import 'dart:convert';

class Currency {
  String? result;
  String? timeLastUpdate;
  String? baseCode;
  List<Rates> ratesList = [];
  Rates? rates;

  // Map<String, dynamic>? ratesMap2;
  // Map<String, dynamic>? ratesMap;

  Currency({
    this.result,
    this.timeLastUpdate,
    this.baseCode,
    // this.ratesMap,
  });

  Currency.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    timeLastUpdate = json["time_last_update_utc"];
    // //first conver int type to String than String to DateTime
    // DateTime.parse(json['time_last_update_utc'].toString());
    baseCode = json['base_code'];
    //API return the curancy name as key and rate as vale
    //we ned to saprate that at firsat because we need the currancy name and ret too
    //for this we use forEach funcation and saprate the two values and pass this values to the Rates's funcation fromJason
    json['rates'].forEach((key, value) {
      ratesList.add(Rates(currancyName: key, rate: value));

      // Rates.fromJson(key, value);
      // rates = json['rates'] != null ? new Rates.fromJson(key, value) : null;
      // ratesMap2['currancyName'] = key;
      // ratesMap2['rate'] = value;
    });
    print(ratesList.length);
    // rates = json['rates'] != null ? new Rates.fromJson(json[ratesMap2]) : null;
  }
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['result'] = this.result;
  //   data['time_last_update_unix'] = this.timeLastUpdateUnix;
  //   data['baseCode'] = this.baseCode;
  //   if (this.rates != null) {
  //     data['rates'] = this.rates!.toJson();
  //   }
  //   return data;
  // }
}

class Rates {
  String? currancyName;
  dynamic rate;
  // List<Rates> ratesList = [];
  Rates({this.currancyName, this.rate});

  Rates.fromJson(key, value) {
    // ratesList.add(Rates(currancyName: key, rate: value));
    // print(ratesList.length);
    // print(rate);
    // print(ratesList[0]);
  }
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['currancyName'] = this.currancyName;
  //   data['rate'] = this.rate;
  //   return data;
  // }
}
