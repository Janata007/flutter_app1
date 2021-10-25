import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ss/src/model/dto/invoicedto.dart';
import 'package:ss/src/ui/widgets/my_invoice_widget.dart';

class MyInvoicePage extends StatelessWidget {
  const MyInvoicePage({Key? key, required this.invoice}) : super(key: key);

  final Invoice invoice;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            AppBar(
              title: const Text('Фактура'),
            ),
            InvoiceCard(invoice),
          ],
        ),
      ),
    );
  }
}
