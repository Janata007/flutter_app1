import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:ss/src/model/enum/product_type.dart';
import 'package:ss/src/model/formatter.dart';
import 'package:ss/src/model/dto/productdto.dart';
import 'package:ss/src/resource/data.dart';
import 'package:ss/src/resource/fiscal_api_provider.dart';
import 'package:ss/src/resource/invoice_api_proivder.dart';
import 'package:ss/src/resource/product_api_provider.dart';
import 'package:ss/src/ui/product_list.dart';
import 'package:ss/src/ui/widgets/my_text_form_field.dart';

class ProductSearchPage extends StatefulWidget {
  const ProductSearchPage({Key? key}) : super(key: key);

  @override
  _FiscalSearchPageState createState() => _FiscalSearchPageState();
}

ProductDto productToSend = ProductDto();
List<ProductDto> products = [];
GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class _FiscalSearchPageState extends State<ProductSearchPage> {
  InvoiceApiProvider apiProvider = InvoiceApiProvider();
  FiscalApiProvider fiscalApiProvider = FiscalApiProvider();
  ProductApiProvider productApiProvider = ProductApiProvider();

  final TextEditingController _typeaheadController = TextEditingController();
  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _toController = TextEditingController();
  final TextEditingController _workDayController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  String dropdownValue = "Commercial";

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(_onScroll);

    //_typeaheadController.text = 'search..';
    if (productToSend.startActiveDate != null) {
      DateTime startDate =
          DateTime.parse(productToSend.startActiveDate.toString());
      _fromController.text = formatter.format(startDate.toLocal());
    }
    if (productToSend.endActiveDate != null) {
      DateTime startDate =
          DateTime.parse(productToSend.endActiveDate.toString());
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
    final searchProductName = TypeAheadFormField<dynamic>(
      errorBuilder: (BuildContext context, Object error) =>
          Text('$error', style: TextStyle(color: Theme.of(context).errorColor)),
      loadingBuilder: (context) {
        return const CircularProgressIndicator();
      },
      textFieldConfiguration: TextFieldConfiguration(
          decoration: MyInputDecoration(hintText: 'име на продукт..'),
          controller: _typeaheadController),
      suggestionsCallback: (pattern) {
        return productApiProvider.autocompleteProduct(pattern);
      },
      itemBuilder: (BuildContext context, dynamic suggestion) {
        final product = suggestion!;
        return ListTile(
          title: Text((product as ProductDto).productName.toString()),
        );
      },
      transitionBuilder: (context, suggestionsBox, controller) =>
          suggestionsBox,
      noItemsFoundBuilder: (_) => const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text("нема резултати"),
      ),
      onSuggestionSelected: (p) {
        ProductDto pr = p as ProductDto;
        productToSend = pr;
        _typeaheadController.text = pr.productName.toString();
      },
    );
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
      items: <String>['Commercial', 'Medicine']
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
                productToSend = ProductDto();
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
                      title: searchProductName),
                  ListTile(
                      leading: const Icon(
                        Icons.arrow_drop_down,
                        size: 40,
                      ),
                      title: dropdownMenu),
                ],
              )),
          padding,
          TextButton(
              onPressed: () {
                if(dropdownValue.startsWith('Commercial')) {
                  productToSend.productType = ProductType.C;
                } else {
                  productToSend.productType = ProductType.L;
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductListPage(
                            productDto: productToSend, productType: dropdownValue,
                          )),
                );
              },
              child: const Text(
                'Пребарајте продукти',
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
