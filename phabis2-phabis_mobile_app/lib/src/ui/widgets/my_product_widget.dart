import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ss/src/model/dto/productdto.dart';
import 'package:ss/src/model/enum/product_type.dart';
import 'package:ss/src/resource/data.dart';

Widget productCard(ProductDto product) {
  String productTip='';
  if(product.productType == ProductType.C){
    productTip='Комерцијален';
  }else{
    productTip='Лек';
  }
  String proizvoditel='';
  if(product.manufacturer?.partnerName !=null ){
    proizvoditel = product.manufacturer!.partnerName.toString();
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
              Flexible(
                child: Container(
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
                          const Text(
                            'Име на документ: ',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 13),
                          ),
                          Expanded(
                            child: Text(
                              product.productName.toString(),
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
                        'Тип на продукт:',
                        style: TextStyle(fontSize: 13),
                      ),
                      Padding(padding: EdgeInsets.all(5)),
                      Text(
                        productTip,
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
                      'малопродажна цена:',
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
                      product.outputRetailPrice.toString(),
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
                      'производител:',
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
                      proizvoditel,
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
                        'Парчиња по пакет:',
                        style: TextStyle(fontSize: 13),
                      ),
                      Padding(padding: EdgeInsets.all(5)),
                      Text(
                        product.piecesPerPackage.toString(),
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
                        'Тип на пакување:',
                        style: TextStyle(fontSize: 13),
                      ),
                      Padding(padding: EdgeInsets.all(5)),
                      Text(
                        product.packagingType.toString().substring(14),
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
