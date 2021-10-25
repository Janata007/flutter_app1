import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ss/src/model/dto/productdto.dart';
import 'package:ss/src/model/dto/turnover_fiscal_dto.dart';
import 'package:ss/src/model/dto/turnover_fiscal_reimbursement_dto.dart';
import 'package:ss/src/ui/widgets/my_fiscal_widget.dart';
import 'package:ss/src/ui/widgets/my_product_widget.dart';

class MyProductPage extends StatelessWidget {
  const MyProductPage({Key? key, required this.product}) : super(key: key);

  final ProductDto product;

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
            productCard(product),
          ],
        ),
      ),
    );
  }
}
