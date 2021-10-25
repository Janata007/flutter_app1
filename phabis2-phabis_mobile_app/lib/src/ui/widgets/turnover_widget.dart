import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ss/src/model/dto/pharmacy_dto.dart';
import 'package:ss/src/model/dto/turnover_fiscal_reimbursement_dto.dart';
import 'package:ss/src/resource/data.dart';
import 'package:ss/src/resource/fiscal_api_provider.dart';
import 'package:ss/src/resource/pharmacy_api_provider2.dart';

class TurnoverWidget extends StatefulWidget {
  const TurnoverWidget({Key? key}) : super(key: key);

  @override
  _TurnoverWidgetState createState() => _TurnoverWidgetState();
}

class _TurnoverWidgetState extends State<TurnoverWidget> {
  final globalKey = GlobalKey<ScaffoldState>();
  TurnoverFiscalReimbursementDto fiscal = TurnoverFiscalReimbursementDto();
  FiscalApiProvider fiscalApiProvider = FiscalApiProvider();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<TurnoverFiscalReimbursementDto>>(
        future: getFiscalResult(fiscal), //getPharmacyResult()
        builder:
            (BuildContext context, AsyncSnapshot<List<TurnoverFiscalReimbursementDto>> snapshot) {
          if (snapshot.hasData) {
            double promet=0;
            double quantity=0;
            double retailprice = 0;
            for(int i=0; i<snapshot.data!.length; i++){
              quantity +=  snapshot.data![i].quantity!;
              retailprice += snapshot.data![i].retailPrice!;
            }
            promet = quantity*retailprice;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text("Промет: ",
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                Flexible( child:
                Text(promet.toString(),
                    style: const TextStyle(fontSize: 16, overflow: TextOverflow.ellipsis))
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          } else {
            return Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(20),
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
