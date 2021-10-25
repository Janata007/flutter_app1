import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ss/src/model/dto/pharmacy_dto.dart';
import 'package:ss/src/resource/pharmacy_api_provider2.dart';

class PharmacyWidget extends StatefulWidget {
  const PharmacyWidget({Key? key}) : super(key: key);

  @override
  _PharmacyWidgetState createState() => _PharmacyWidgetState();
}

class _PharmacyWidgetState extends State<PharmacyWidget> {
  final globalKey = GlobalKey<ScaffoldState>();
  PharmacyApiProvider2 pharmacyApiProvider = PharmacyApiProvider2();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PharmacyDto>>(
        future: pharmacyApiProvider.fetchPharmacy(), //getPharmacyResult()
        builder:
            (BuildContext context, AsyncSnapshot<List<PharmacyDto>> snapshot) {
          if (snapshot.hasData) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text("Logged in pharmacy: ",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                Text(snapshot.data![0].pharmacyName.toString(),
                    style: TextStyle(fontSize: 16))
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
