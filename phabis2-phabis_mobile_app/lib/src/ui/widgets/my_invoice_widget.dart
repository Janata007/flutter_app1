import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ss/src/model/dto/invoicedto.dart';
import 'package:ss/src/model/enum/turnover_type.dart';
import 'package:ss/src/resource/data.dart';

Widget InvoiceCard(Invoice invoice) {
  String turnoverTip='';
  if(invoice.turnoverType == TurnoverType.C){
    turnoverTip='Комерцијален';
  }else if(invoice.turnoverType == TurnoverType.R){
    turnoverTip='Со партиципација';
  }else{
    turnoverTip='Ортопедски';
  }
  return Center(
    child: Column(children: [
      padding,
      Container(
          height: 290,
          width: 350,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 3,
            ),
          ),
          child: Wrap(
            children: [
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.black, width: 3.0),
                  ),
                ),
                child: Wrap(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Expanded(
                          child: Text(
                            'Име на партнер: ',
                            style: TextStyle(fontSize: 13),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            invoice.counterPartyPartnerName.toString(),
                            softWrap: false,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                  padding: EdgeInsets.all(12),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.black, width: 3.0),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Количина:',
                        style: TextStyle(fontSize: 13),
                      ),
                      Padding(padding: EdgeInsets.all(5)),
                      Text(
                        invoice.purchaseAmount.toString(),
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      padding,
                      const Text(
                        'Тип:',
                        style: TextStyle(fontSize: 13),
                      ),
                      Padding(padding: EdgeInsets.all(5)),
                      Text(
                        turnoverTip,
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ],
                  )),
              padding,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.teal, width: 3.0),
                      ),
                    ),
                    child: const Text(
                      'Износ без ДДВ',
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                  padding,
                  Container(
                    width: 100,
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.teal, width: 3.0),
                      ),
                    ),
                    child: Text(
                      invoice.retailPrice.toString(),
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                  )
                ],
              ),
              Padding(padding: EdgeInsets.all(5)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.teal, width: 3.0),
                      ),
                    ),
                    child: Text(
                      'ДДВ %',
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                  padding,
                  Container(
                    width: 100,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.teal, width: 3.0),
                      ),
                    ),
                    child: Text(
                      invoice.retailMargin.toString(),
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                  )
                ],
              ),
              Padding(padding: EdgeInsets.all(5)),
              Container(
                  padding: EdgeInsets.all(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Вупно:',
                        style: TextStyle(fontSize: 13),
                      ),
                      Padding(padding: EdgeInsets.all(5)),
                      Text(
                        invoice.invoicePrice.toString(),
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ],
                  )),
              Container(
                  padding: EdgeInsets.all(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Датум:',
                        style: TextStyle(fontSize: 13),
                      ),
                      Padding(padding: EdgeInsets.all(5)),
                      Text(
                        invoice.documentDate.toString().substring(0, 10),
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ],
                  )),
            ],
          )),
      padding
    ]),
  );
}
