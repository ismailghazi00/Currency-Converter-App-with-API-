import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../module/data_class.dart';
//we must add "http:" in pubspec.yml and import the packeage "import 'package:http/http.dart' as http;"

class CurencyListMainUI extends StatefulWidget {
  const CurencyListMainUI({super.key});

  @override
  State<CurencyListMainUI> createState() => _CurencyListMainUIState();
}

class _CurencyListMainUIState extends State<CurencyListMainUI> {
//All vareables class will come here
  Currency currency = Currency();
  Rates rates = Rates();
  String? SalactedbasCoed;
  var cityTextFieldControler = TextEditingController();

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
        await http.get(Uri.parse("https://open.er-api.com/v6/latest/pkr"));
    //then we wil put this funcation in initState to get data at avery re starte/ after build screen
    print(response.body);
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
                  Text("Currency Converter",
                      style: Theme.of(context).textTheme.bodyMedium),
                  TextField(
                      decoration: textFieldCustomDecuration(
                          'Search for Your Currency')),
                  Text("Curent Currency",
                      style: Theme.of(context).textTheme.bodySmall),
                  Text(currency.baseCode.toString(),
                      style: Theme.of(context).textTheme.bodyLarge),
                  Container(
                    decoration: BoxDecoration(
                        color: const Color(0xff2F2F34),
                        borderRadius: BorderRadius.circular(30)),
                    child: Text("Thu, 20 Jul 2023",
                        style: Theme.of(context).textTheme.bodySmall),
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: rates.value?.length == null
                            ? 10
                            : rates.value!.length,
                        itemBuilder: ((context, index) {
                          return Column(
                            children: [
                              SizedBox(
                                height: 45,
                                child: Row(children: [
                                  const CircleAvatar(
                                      backgroundColor: Color(0xff2A3547),
                                      foregroundImage: AssetImage(
                                          "assets/CurrencyConverterIcon.png")),
                                  Text(
                                    currency.rates!.key.toString(),
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                  const Spacer(),
                                  Text(
                                    currency.rates!.value.toString(),
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  )
                                ]),
                              ),
                              const Divider(
                                color: Color(0xff212436),
                              )
                            ],
                          );
                        })),
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ]))));
  }

  InputDecoration textFieldCustomDecuration(String hinttext) {
    return InputDecoration(
      filled: true,
      fillColor: const Color(0xff212436),
      border: const OutlineInputBorder(),
      enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          borderSide: BorderSide.none),
      focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          borderSide: BorderSide.none),
      hintText: hinttext,
      hintStyle: Theme.of(context).textTheme.bodySmall,
    );
  }
}
