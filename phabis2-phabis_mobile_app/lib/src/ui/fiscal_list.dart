import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ss/src/model/dto/turnover_fiscal_reimbursement_dto.dart';
import 'package:ss/src/resource/data.dart';
import 'package:ss/src/ui/selected_fiscal.dart';

class FiscalListPage extends StatefulWidget {
  const FiscalListPage({Key? key, required this.fiscalDto, required this.type})
      : super(key: key);
  final TurnoverFiscalReimbursementDto fiscalDto;
  final String type;

  @override
  _FiscalListPageState createState() => _FiscalListPageState();
}

class _FiscalListPageState extends State<FiscalListPage> {
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
        title: const Text('Fiscal list'),
      ),
      body: FutureBuilder<List<TurnoverFiscalReimbursementDto>>(
          future: getFiscalResult(widget.fiscalDto),
          builder: (BuildContext context,
              AsyncSnapshot<List<TurnoverFiscalReimbursementDto>> snapshot) {
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
                            TurnoverFiscalReimbursementDto listFiscal =
                                snapshot.data![index];
                            if (listFiscal.turnoverType ==
                                stringToTurnoverType(widget.type)) {
                              String documentNumber = snapshot
                                  .data![index].documentNumber
                                  .toString();
                              String dataDocumentDate = snapshot
                                  .data![index].documentDate
                                  .toString()
                                  .substring(0, 10);
                              String dataDocumentType = snapshot
                                  .data![index].participation
                                  .toString();
                              return ListTile(
                                isThreeLine: true,
                                title: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text((index + 1).toString() + '. '),
                                        Text(documentNumber)
                                      ],
                                    ),
                                  ],
                                ),
                                subtitle: Column(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text("датум: " + dataDocumentDate),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text("тип: " + dataDocumentType)
                                      ],
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            MyFiscalPage(fiscal: listFiscal)),
                                  );
                                },
                              );
                            } else
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
