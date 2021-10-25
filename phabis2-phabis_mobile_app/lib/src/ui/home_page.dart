import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ss/src/model/dto/turnover_fiscal_reimbursement_dto.dart';
import 'package:ss/src/resource/data.dart';
import 'package:ss/src/resource/invoice_api_proivder.dart';
import 'package:ss/src/resource/login_api_provider.dart';
import 'package:ss/src/ui/invoice_search_page.dart';
import 'package:ss/src/ui/product_search_page.dart';
import 'package:ss/src/ui/widgets/pharmacy_logged_in_widget.dart';
import 'package:ss/src/ui/widgets/turnover_widget.dart';

import 'fiscal_search_page.dart';

InvoiceApiProvider invoiceApiProvider = InvoiceApiProvider();
TurnoverFiscalReimbursementDto fiscalDto = TurnoverFiscalReimbursementDto();
LoginApiProvider loginApiProvider = LoginApiProvider();

class HomePage extends StatefulWidget {
  static String tag = "home-page";

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

/*Future<String> fetchToken() async {
  mainToken = await loginApiProvider.fetchToken();
  return loginApiProvider.fetchToken();
}*/

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    if(mainToken!=null){
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
                Container(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      padding,
                      const Text(
                        "Добредојдовте",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                      padding,
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SearchPage()));
                          },
                          child: const Text('Пребарување фактури',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20))),
                      padding,
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FiscalSearchPage()));
                          },
                          child: const Text('Пребарување сметки',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20))),
                      padding,
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProductSearchPage()));
                          },
                          child: const Text('Пребарување продукти',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20))),
                      padding,
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamedAndRemoveUntil(
                                context, "LoginPage()", (r) => false);
                          },
                          child: const Text('Одјавете се',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20))),
                      padding,
                      Container(
                        height: 100,
                        width: 200,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.teal,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          verticalDirection: VerticalDirection.up,
                          children: const [
                           TurnoverWidget(),
                          ],
                        ),
                      ),
                      padding,
                      PharmacyWidget()
                    ],
                  ),
                ),
        ],
      ),
    );}else {
      return Text("wrong");
    }
  }
}
