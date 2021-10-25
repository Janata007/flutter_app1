import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:ss/src/model/enum/turnover_type.dart';
import 'package:ss/src/model/formatter.dart';
import 'package:ss/src/model/dto/invoicedto.dart';
import 'package:ss/src/model/dto/partnerdto.dart';
import 'package:ss/src/resource/invoice_api_proivder.dart';
import 'package:ss/src/resource/data.dart';
import 'package:ss/src/ui/widgets/my_text_form_field.dart';

import 'invoice_list.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

Invoice invoiceToSend = Invoice();
List<Invoice> invoices = [];
GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class _SearchPageState extends State<SearchPage> {
  String dropdownValue = "Комерцијална продажба";

  InvoiceApiProvider apiProvider = InvoiceApiProvider();

  final TextEditingController _typeaheadController = TextEditingController();
  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _toController = TextEditingController();
  final TextEditingController _workDayController = TextEditingController();

  @override
  void initState() {
    super.initState();

    PartnerDto partner = PartnerDto();
    partner.partnerName = '';
    invoiceToSend.counterParty = partner;
    _typeaheadController.text = 'partner name..';
    if (invoiceToSend.filterStartDate != null) {
      DateTime startDate =
          DateTime.parse(invoiceToSend.filterStartDate.toString());
      _fromController.text = formatter.format(startDate.toLocal());
    }
    if (invoiceToSend.filterEndDate != null) {
      DateTime startDate =
          DateTime.parse(invoiceToSend.filterEndDate.toString());
      _fromController.text = formatter.format(startDate.toLocal());
    }
    if (_fromController.text == _toController.text) {
      _workDayController.value = _fromController.value;
    }
  }

  @override
  void dispose() {
    _typeaheadController.dispose();
    _fromController.dispose();
    _toController.dispose();
    _workDayController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchPartnerName = TypeAheadFormField<dynamic>(
      errorBuilder: (BuildContext context, Object error) =>
          Text('$error', style: TextStyle(color: Theme.of(context).errorColor)),
      loadingBuilder: (context) {
        return const CircularProgressIndicator();
      },
      textFieldConfiguration: TextFieldConfiguration(
          decoration: MyInputDecoration(hintText: 'име на партнер'),
          controller: _typeaheadController),
      suggestionsCallback: (pattern) {
        return apiProvider.autocompletePartner(pattern);
      },
      itemBuilder: (BuildContext context, dynamic suggestion) {
        final partner = suggestion!;
        return ListTile(
          title: Text((partner as PartnerDto).partnerName.toString()),
        );
      },
      transitionBuilder: (context, suggestionsBox, controller) =>
          suggestionsBox,
      noItemsFoundBuilder: (_) => const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text("нема резултати"),
      ),
      onSuggestionSelected: (p) {
        PartnerDto partner = p as PartnerDto;
        invoiceToSend.counterParty = PartnerDto();
        invoiceToSend.counterParty!.id = partner.id;
        _typeaheadController.text = partner.partnerName.toString();
      },
    );

    final from = DateTimePickerFormField(
        controller: _fromController,
        initialValue: DateTime(1, 1, 1, 1, 1, 0),
        format: formatter,
        dateOnly: true,
        decoration: const InputDecoration(labelText: 'од'),
        onChanged: (dt) => setState(() =>
            invoiceToSend.filterStartDate = dt.toUtc().toIso8601String()));
    final to = DateTimePickerFormField(
        controller: _toController,
        initialValue: DateTime(1, 1, 1, 1, 1, 0),
        format: formatter,
        dateOnly: true,
        decoration: const InputDecoration(labelText: 'до'),
        onChanged: (dt) => setState(
            () => invoiceToSend.filterEndDate = dt.toUtc().toIso8601String()));
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
        dropdownValue = newValue!;
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: <String>['Комерцијална продажба', 'Со партиципација', 'Ортопедски помагала']
          .map<DropdownMenuItem<String>>((String value) {
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
                invoiceToSend = Invoice();
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
                        Icons.text_fields,
                        size: 40,
                      ),
                      title: searchPartnerName),
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
                  ListTile(
                      title: dropdownMenu),
                ],
              )),
          padding,
          TextButton(
              onPressed: () {
                print(invoiceToSend.filterEndDate);
                print(invoiceToSend.filterStartDate);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyListPage(
                            invoice: invoiceToSend, turnovertype: dropdownValue,
                          )),
                );
              },
              child: const Text(
                'Пребарајте фактури',
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
