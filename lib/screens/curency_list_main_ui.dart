import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//we must add "http:" in pubspec.yml and import the packeage "import 'package:http/http.dart' as http;"
import '../module/classdata.dart';
import '../widgets/currency_tile_widget.dart';
// import 'package:intl/intl.dart';
// import 'package:dropdown_search/dropdown_search.dart';
// import '../module/enum_list.dart';

class CurencyListMainUI extends StatefulWidget {
  const CurencyListMainUI({super.key});

  @override
  State<CurencyListMainUI> createState() => _CurencyListMainUIState();
}

class _CurencyListMainUIState extends State<CurencyListMainUI> {
//All vareables class will come here
  Currency currency = Currency();
  Rates rate = Rates();
  TextEditingController currencyTextFieldControler = TextEditingController();
  String currencySearchedName = 'usd';

  @override
  void initState() {
    getCurrencyDataFromAPI();
    super.initState();
  }

//to get data from the API we must creat a funcation of type Future
  Future<void> getCurrencyDataFromAPI() async {
    http.Response response =
        //we first save the data in virable response of data type http.Response by using funcation http.get
        //http.get require Uri.parse and this funcation need String url
        await http.get(Uri.parse(
            "https://open.er-api.com/v6/latest/$currencySearchedName"));
    //then we wil put this funcation in initState to get data at avery re starte/ after build screen
    //response.body hold all the data

    setState(() {
      currency = Currency.fromJson(jsonDecode(response.body));
    });
    // setState(() {
    //   final jsonOfAPIsBody = jsonDecode(response.body);
    //   final jsonOfAPIsRates = jsonDecode(jsonOfAPIsBody['rates']);
    //   currency.rates = Rates.fromJson(jsonOfAPIsRates);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff0F111E),
        body: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/BackgroundDesign.png"),
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.topLeft,
                    opacity: 0.2)),
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(children: [
                  const SizedBox(height: 10),
                  Text("Currency Converter",
                      style: Theme.of(context).textTheme.bodyMedium),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 40,
                    child: TextField(
                        //-----------------------------------------Search Text Field
                        controller: currencyTextFieldControler,
                        //on change creat a olot truble for me, so if using controller ther is no need to use on change
                        //controller shoul handel on change activities by it self
                        // onChanged: (v) {
                        //   currencyTextFieldControler.text = v;
                        // },
                        textDirection: TextDirection.ltr,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          isDense: true,
                          suffix: IconButton(
                              padding: const EdgeInsets.only(top: 10),
                              onPressed: () {
                                setState(() {
                                  currencySearchedName =
                                      currencyTextFieldControler.text;
                                  getCurrencyDataFromAPI();
                                  currencyTextFieldControler.clear();
                                });
                              },
                              icon:
                                  const Icon(Icons.send, color: Colors.white)),
                          filled: true,
                          fillColor: const Color(0xff212436),
                          border: const OutlineInputBorder(),
                          enabledBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              borderSide: BorderSide.none),
                          focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              borderSide: BorderSide.none),
                          hintText: 'Search for Your Currency type',
                          hintStyle: Theme.of(context).textTheme.bodySmall,
                        )),
                  ),
                  const SizedBox(height: 20),
                  Text("Curent Currency",
                      style: Theme.of(context).textTheme.bodySmall),
                  Text('${currency.baseCode}',
                      style: Theme.of(context).textTheme.bodyLarge),
                  Container(
                      decoration: BoxDecoration(
                          color: const Color(0xff2F2F34),
                          borderRadius: BorderRadius.circular(30)),
                      child: Text(
                          // 'last update on${styleDateandTime(currency.timeLastUpdate)}',
                          '${currency.timeLastUpdate?.replaceAll('+0000', "")}',
                          style: Theme.of(context).textTheme.bodySmall)),
                  const SizedBox(height: 20),
                  // DropdownSearch(
                  //   dropdownDecoratorProps: DropDownDecoratorProps(
                  //     dropdownSearchDecoration: InputDecoration(
                  //         label: Text(
                  //           'Country names',
                  //           style: Theme.of(context).textTheme.titleMedium,
                  //         ),
                  //         filled: true,
                  //         fillColor: const Color(0xff2F2F34),
                  //         suffixIconColor: Colors.white,

                  //         ),
                  //   ),
                  //   items: currencyNamesList,
                  // ),
                  Expanded(
                    child: ListView.builder(
                        itemCount:
                            currency.ratesList.length, //rate.ratesList.length,
                        itemBuilder: ((context, index) {
                          // return Container(
                          //     child: Text(
                          //         '${currency.ratesList[index].currancyName}'));
                          return CurrencyTileWidget(
                              currency: currency, index: index);
                        })),
                  ),
                  const SizedBox(height: 10)
                ]))));
  }
}
