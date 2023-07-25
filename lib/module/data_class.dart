class Currency {
  // ignore: non_constant_identifier_names
  String? result;
  int? timeLastUpdateUnix;
  String? baseCode;
  Rates? rates;

  Currency({this.result, this.timeLastUpdateUnix, this.baseCode, this.rates});

  Currency.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    timeLastUpdateUnix = json['time_last_update_unix'];
    baseCode = json['base_code'];
    rates = json['rates'] != null ? new Rates.fromJson(json['rates']) : null;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = this.result;
    data['time_last_update_unix'] = this.timeLastUpdateUnix;
    data['base_code'] = this.baseCode;
    if (this.rates != null) {
      data['rates'] = this.rates!.toJson();
    }
    return data;
  }
}

class Rates {
  String? key;
  String? value;

  Rates({this.key, this.value});

  Rates.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    value = json['value'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['value'] = this.value;
    return data;
  }
}

// class Currency {
//   // ignore: non_constant_identifier_names
//   String? base_code;

//   Currency({
//     // ignore: non_constant_identifier_names
//     this.base_code,
//   });

//   Currency.fromJson(Map<String, dynamic> json) {
//     base_code = json['base_code'];
//   }
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['base_code'] = this.base_code;

//     return data;
//   }
// }

// class Rates {
//   String? key;
//   String? value;

//   Rates({this.key, this.value});

//   Rates.fromJson(Map<String, dynamic> json) {
//     key = json['key'];
//     value = json['value'];
//   }
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['key'] = this.key;
//     data['value'] = this.value;
//     return data;
//   }
// }
