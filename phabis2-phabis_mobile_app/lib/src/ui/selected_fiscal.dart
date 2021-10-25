import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ss/src/model/dto/turnover_fiscal_dto.dart';
import 'package:ss/src/model/dto/turnover_fiscal_reimbursement_dto.dart';
import 'package:ss/src/ui/widgets/my_fiscal_widget.dart';

class MyFiscalPage extends StatelessWidget {
  const MyFiscalPage({Key? key, required this.fiscal}) : super(key: key);

  final TurnoverFiscalReimbursementDto fiscal;

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
            fiscalCard(fiscal),
          ],
        ),
      ),
    );
  }
}
