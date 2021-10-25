import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ss/src/model/dto/invoicedto.dart';
import 'package:ss/src/resource/data.dart';
import 'package:ss/src/ui/selected_invoice.dart';

class MyListPage extends StatefulWidget {
  const MyListPage({Key? key, required this.invoice, required this.turnovertype}) : super(key: key);
  final Invoice invoice;
  final String turnovertype;

  @override
  _MyListPageState createState() => _MyListPageState();
}

class _MyListPageState extends State<MyListPage> {
  bool _isLoading = false;
  final ScrollController _scrollController = ScrollController();
  final globalKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  _onScroll() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      setState(() {
        _isLoading = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: globalKey,
      appBar: AppBar(
        title: const Text('Листа на фактури'),
      ),
      body: FutureBuilder<List<Invoice>>(
          future: getInvoicesResult(widget.invoice),
          builder:
              (BuildContext context, AsyncSnapshot<List<Invoice>> snapshot) {
            if (snapshot.hasData) {
              return Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Flexible(
                      child: ListView.builder(
                          controller: _scrollController,
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (BuildContext context, int index) {
                            if (snapshot.data!.length == index) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                            String dataPartnerName = '';
                            String dataDocumentDate = '';
                            String dataDocumentNumber = '';

                            Invoice listInvoice = snapshot.data![index];

                            if(listInvoice.turnoverType == stringToTurnoverType(widget.turnovertype)) {
                              dataPartnerName = snapshot
                                  .data![index].counterPartyPartnerName
                                  .toString();
                              dataDocumentDate = snapshot
                                  .data![index].documentDate
                                  .toString()
                                  .substring(0, 10);
                              dataDocumentNumber =
                                  snapshot.data![index].documentDate.toString();
                              return ListTile(
                                isThreeLine: true,
                                title: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .start,
                                      children: [
                                        Text((index + 1).toString() + '. '),
                                        Text(dataPartnerName)
                                      ],
                                    ),
                                  ],
                                ),
                                subtitle: Column(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .start,
                                      children: [
                                        Text("датум: " + dataDocumentDate),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .start,
                                      children: [
                                        Text("број на документ: " +
                                            dataDocumentNumber)
                                      ],
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            MyInvoicePage(
                                                invoice: listInvoice)),
                                  );
                                },
                              );
                            }else
                              return SizedBox.shrink();
                          }),
                    ),
                  ],
                ),
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
          }),
    );
  }
}
