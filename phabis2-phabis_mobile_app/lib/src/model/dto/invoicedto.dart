import 'package:json_annotation/json_annotation.dart';
import 'package:ss/src/model/dto/pharmacy_dto.dart';
import 'package:ss/src/model/dto/productdto.dart';
import 'package:ss/src/model/dto/turnover_dto.dart';

import '../enum/document_type.dart';
import '../enum/dto_type.dart';
import '../enum/turnover_type.dart';
import 'account_dto.dart';
import 'partnerdto.dart';

part 'invoicedto.g.dart';

@JsonSerializable()
class Invoice extends TurnoverDto {
  String? partnerDocumentNumber;
  String? partnerDocumentDate;
  String? partnerDocumentDueDatePayment;
  double? invoicePrice;
  double? discountRate;
  double? discountAmount;
  double? purchasePrice;
  double? purchaseAmount;
  double? vatPurchaseAmount;
  double? partnerDocumentAmount;
  bool? reimbursement;
  double? retailMargin;
  double? retailPrice;
  double? fzoRefPrice;
  PartnerDto? counterParty;
  String? counterPartyPartnerId;
  String? counterPartyPartnerName;

  String? filterStartPartnerDocumentDate;
  String? filterEndPartnerDocumentDate;
  String? filterStartPartnerDocumentDueDatePayment;
  String? filterEndPartnerDocumentDueDatePayment;

  DtoType? dtoType;
  TurnoverType? turnoverType; //tip na promet, C-komercijalna R-pozitivna lista
  DocumentType? documentType;

  ProductDto? product;
  AccountDto? account;
  PharmacyDto? pharmacy;

  Invoice(
      {this.product,
        this.pharmacy,
        this.account,
        this.documentType,
      this.turnoverType,
      this.fzoRefPrice,
      this.retailPrice,
      this.counterPartyPartnerName,
      this.counterParty,
      this.counterPartyPartnerId,
      this.filterEndPartnerDocumentDate,
      this.filterStartPartnerDocumentDate,
      this.filterStartPartnerDocumentDueDatePayment,
      this.filterEndPartnerDocumentDueDatePayment,
      this.partnerDocumentDueDatePayment,
      this.partnerDocumentDate,
      this.purchasePrice,
      this.reimbursement,
      this.retailMargin,
      this.partnerDocumentAmount,
      this.vatPurchaseAmount,
      this.purchaseAmount,
      this.discountAmount,
      this.discountRate,
      this.invoicePrice,
      this.partnerDocumentNumber,
      this.dtoType});

  factory Invoice.fromJson(Map<String, dynamic> data) =>
      _$InvoiceFromJson(data);

  Map<String, dynamic> toJson() => _$InvoiceToJson(this);
}
