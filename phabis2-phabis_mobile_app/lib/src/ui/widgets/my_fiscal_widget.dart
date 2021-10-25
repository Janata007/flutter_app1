import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ss/src/model/dto/turnover_fiscal_reimbursement_dto.dart';
import 'package:ss/src/resource/data.dart';

Widget fiscalCard(TurnoverFiscalReimbursementDto fiscal) {
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
                decoration: const BoxDecoration(
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
                            'Број на документ: ',
                            style: TextStyle(fontSize: 13),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            fiscal.documentNumber.toString(),
                            softWrap: false,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
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
                        fiscal.quantity.toString(),
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
                      'цена:',
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
                      fiscal.retailPrice.toString(),
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
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.teal, width: 3.0),
                      ),
                    ),
                    child: const Text(
                      'износ:',
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
                      fiscal.retailAmount.toString(),
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
                      const Text(
                        'Партиципација:',
                        style: TextStyle(fontSize: 13),
                      ),
                      Padding(padding: EdgeInsets.all(5)),
                      Text(
                        fiscal.participation.toString(),
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ],
                  )),
              Container(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Датум:',
                        style: TextStyle(fontSize: 13),
                      ),
                      Padding(padding: EdgeInsets.all(5)),
                      Text(
                        fiscal.documentDate.toString().substring(0, 10),
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
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
