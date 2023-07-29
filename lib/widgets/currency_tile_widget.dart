import 'package:flutter/material.dart';

import '../module/classdata.dart';

class CurrencyTileWidget extends StatefulWidget {
  CurrencyTileWidget({super.key, required this.index, required this.currency});
  final Currency currency;
  int index;

  @override
  State<CurrencyTileWidget> createState() => _CurrencyTileWidgetState();
}

class _CurrencyTileWidgetState extends State<CurrencyTileWidget> {
  TextEditingController basTextFieldController = TextEditingController();
  TextEditingController calculatorTextFieldController = TextEditingController();
  double? tempdouble;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          basTextFieldController.text = '${widget.currency.ratesList[0].rate}';
          calculatorTextFieldController.text =
              '${widget.currency.ratesList[widget.index].rate}';
        });
        showModalBottomSheet(
            //-------------------------------------------------------Bottom Sheet
            context: context,
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(children: [
                  SizedBox(
                    height: 130,
                    width: 130,
                    child: IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          "assets/CurrencyConverterIcon.png",
                          fit: BoxFit.fill,
                        )),
                  ),
                  TextField(
                    controller: basTextFieldController,
                    onChanged: (value) {
                      tempdouble = basTextFieldController.text.isEmpty
                          ? 0
                          : double.parse(basTextFieldController.text) *
                              double.parse(widget
                                  .currency.ratesList[widget.index].rate
                                  .toString());
                      setState(() {
                        calculatorTextFieldController.text =
                            tempdouble.toString();
                      });
                    },
                    decoration: textFieldCustomDecuration(
                        '${widget.currency.ratesList[0].currancyName}'),
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    readOnly: true,
                    controller: calculatorTextFieldController,
                    decoration: textFieldCustomDecuration(
                        '${widget.currency.ratesList[widget.index].currancyName}'),
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 15)
                ]),
              );
            },
            shape: const BeveledRectangleBorder(
                //to give uper part the circularr shape
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            backgroundColor: const Color(0xff0F111E));
      },
      child: Column(
        //----------------------------------------------------------Tile Widget
        children: [
          SizedBox(
            height: 45,
            child: Row(children: [
              const SizedBox(width: 10),
              CircleAvatar(
                  backgroundColor: const Color(0xff2A3547),
                  radius: 25,
                  // foregroundImage: AssetImage(
                  //   "assets/CurrencyConverterIcon.png",
                  // ),
                  child: Image.asset(
                    "assets/CurrencyConverterIcon.png",
                    height: 35,
                  )),
              const SizedBox(width: 15),
              Text(
                widget.currency.ratesList[widget.index].currancyName == null
                    ? "Lodaing"
                    : '${widget.currency.ratesList[widget.index].currancyName}',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const Spacer(),
              Text(
                widget.currency.ratesList[widget.index].rate == null
                    ? "Lodaing"
                    : '${widget.currency.ratesList[widget.index].rate.toStringAsFixed(2)}',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(width: 10),
            ]),
          ),
          const Divider(
            color: Color(0xff212436),
          )
        ],
      ),
    );
  }

  InputDecoration textFieldCustomDecuration(suffixText) {
    return InputDecoration(
      suffixIcon: Padding(
        padding: const EdgeInsets.only(right: 20, top: 10),
        child:
            Text('$suffixText', style: Theme.of(context).textTheme.titleSmall),
      ),
      filled: true,
      fillColor: const Color(0xff212436),
      border: const OutlineInputBorder(),
      enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          borderSide: BorderSide.none),
      focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          borderSide: BorderSide.none),
    );
  }
}
