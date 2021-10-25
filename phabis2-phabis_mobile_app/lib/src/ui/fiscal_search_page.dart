import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ss/src/model/dto/turnover_fiscal_reimbursement_dto.dart';
import 'package:ss/src/model/formatter.dart';
import 'package:ss/src/resource/data.dart';
import 'package:ss/src/resource/fiscal_api_provider.dart';
import 'package:ss/src/resource/invoice_api_proivder.dart';

import 'fiscal_list.dart';

class FiscalSearchPage extends StatefulWidget {
  const FiscalSearchPage({Key? key}) : super(key: key);

  @override
  _FiscalSearchPageState createState() => _FiscalSearchPageState();
}

TurnoverFiscalReimbursementDto fiscalToSend = TurnoverFiscalReimbursementDto();
List<TurnoverFiscalReimbursementDto> fiscals = [];
GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class _FiscalSearchPageState extends State<FiscalSearchPage> {
  String dropdownValue = "Комерцијална продажба";

  InvoiceApiProvider apiProvider = InvoiceApiProvider();
  FiscalApiProvider fiscalApiProvider = FiscalApiProvider();

  final TextEditingController _typeaheadController = TextEditingController();
  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _toController = TextEditingController();
  final TextEditingController _workDayController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(_onScroll);

    if (fiscalToSend.filterStartDate != null) {
      DateTime startDate =
          DateTime.parse(fiscalToSend.filterStartDate.toString());
      _fromController.text = formatter.format(startDate.toLocal());
    }
    if (fiscalToSend.filterEndDate != null) {
      DateTime startDate =
          DateTime.parse(fiscalToSend.filterEndDate.toString());
      _fromController.text = formatter.format(startDate.toLocal());
    }
    if (_fromController.text == _toController.text) {
      _workDayController.value = _fromController.value;
    }
  }

  _onScroll() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      setState(() {
        // _isLoading = true;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    _typeaheadController.dispose();
    _fromController.dispose();
    _toController.dispose();
    _workDayController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final from = DateTimePickerFormField(
        controller: _fromController,
        initialValue: DateTime(1, 1, 1, 1, 1, 0),
        format: formatter,
        dateOnly: true,
        decoration: const InputDecoration(labelText: 'од'),
        onChanged: (dt) => setState(
            () => fiscalToSend.filterStartDate = dt.toUtc().toIso8601String()));
    final to = DateTimePickerFormField(
        controller: _toController,
        initialValue: DateTime(1, 1, 1, 1, 1, 0),
        format: formatter,
        dateOnly: true,
        decoration: const InputDecoration(labelText: 'до'),
        onChanged: (dt) => setState(
            () => fiscalToSend.filterEndDate = dt.toUtc().toIso8601String()));
    final dropdownMenu = DropdownButton<String>(
      value: dropdownValue,
      iconSize: 25,
      elevation: 16,
      style: const TextStyle(color: Colors.black, fontSize: 18),
      underline: Container(
        height: 3,
        color: Colors.teal,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>[
        'Комерцијална продажба',
        'Со партиципација',
        'Ортопедски помагала'
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          "Пребарување",
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                fiscalToSend = TurnoverFiscalReimbursementDto();
                setState(() => _resetFields());
              }),
          IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                if (_typeaheadController.text.isEmpty) {}
                _formKey.currentState!.save();
              })
        ],
      ),
      body: Column(
        children: [
          padding,
          Form(
              key: _formKey,
              child: ListView(
                itemExtent: 80,
                shrinkWrap: true,
                padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                children: <Widget>[
                  ListTile(
                      leading: const Icon(
                        Icons.today,
                        size: 40,
                      ),
                      title: from),
                  ListTile(
                      leading: const Icon(
                        Icons.today,
                        size: 40,
                      ),
                      title: to),
                  ListTile(title: dropdownMenu)
                ],
              )),
          padding,
          TextButton(
              onPressed: () {
                print(fiscalToSend.filterEndDate);
                print(fiscalToSend.filterStartDate);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FiscalListPage(
                            fiscalDto: fiscalToSend, type: dropdownValue,
                          )),
                );
              },
              child: const Text(
                'Пребарајте сметки',
                style: TextStyle(fontSize: 23),
              ))
        ],
      ),
    );
  }

  void _resetFields() {
    _formKey.currentState!.reset();
    _typeaheadController.clear();
    _workDayController.clear();
    _fromController.clear();
    _toController.clear();
  }
}
