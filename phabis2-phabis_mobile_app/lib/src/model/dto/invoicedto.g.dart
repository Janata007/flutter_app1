// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoicedto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Invoice _$InvoiceFromJson(Map<String, dynamic> json) => Invoice(
      product: json['product'] == null
          ? null
          : ProductDto.fromJson(json['product'] as Map<String, dynamic>),
      pharmacy: json['pharmacy'] == null
          ? null
          : PharmacyDto.fromJson(json['pharmacy'] as Map<String, dynamic>),
      account: json['account'] == null
          ? null
          : AccountDto.fromJson(json['account'] as Map<String, dynamic>),
      documentType:
          _$enumDecodeNullable(_$DocumentTypeEnumMap, json['documentType']),
      turnoverType:
          _$enumDecodeNullable(_$TurnoverTypeEnumMap, json['turnoverType']),
      fzoRefPrice: (json['fzoRefPrice'] as num?)?.toDouble(),
      retailPrice: (json['retailPrice'] as num?)?.toDouble(),
      counterPartyPartnerName: json['counterPartyPartnerName'] as String?,
      counterParty: json['counterParty'] == null
          ? null
          : PartnerDto.fromJson(json['counterParty'] as Map<String, dynamic>),
      counterPartyPartnerId: json['counterPartyPartnerId'] as String?,
      filterEndPartnerDocumentDate:
          json['filterEndPartnerDocumentDate'] as String?,
      filterStartPartnerDocumentDate:
          json['filterStartPartnerDocumentDate'] as String?,
      filterStartPartnerDocumentDueDatePayment:
          json['filterStartPartnerDocumentDueDatePayment'] as String?,
      filterEndPartnerDocumentDueDatePayment:
          json['filterEndPartnerDocumentDueDatePayment'] as String?,
      partnerDocumentDueDatePayment:
          json['partnerDocumentDueDatePayment'] as String?,
      partnerDocumentDate: json['partnerDocumentDate'] as String?,
      purchasePrice: (json['purchasePrice'] as num?)?.toDouble(),
      reimbursement: json['reimbursement'] as bool?,
      retailMargin: (json['retailMargin'] as num?)?.toDouble(),
      partnerDocumentAmount:
          (json['partnerDocumentAmount'] as num?)?.toDouble(),
      vatPurchaseAmount: (json['vatPurchaseAmount'] as num?)?.toDouble(),
      purchaseAmount: (json['purchaseAmount'] as num?)?.toDouble(),
      discountAmount: (json['discountAmount'] as num?)?.toDouble(),
      discountRate: (json['discountRate'] as num?)?.toDouble(),
      invoicePrice: (json['invoicePrice'] as num?)?.toDouble(),
      partnerDocumentNumber: json['partnerDocumentNumber'] as String?,
      dtoType: _$enumDecodeNullable(_$DtoTypeEnumMap, json['dtoType']),
    )
      ..id = json['id'] as String?
      ..documentNumber = json['documentNumber'] as String?
      ..documentDate = json['documentDate'] as String?
      ..quantity = (json['quantity'] as num?)?.toDouble()
      ..vatRate = (json['vatRate'] as num?)?.toDouble()
      ..divide = (json['divide'] as num?)?.toDouble()
      ..confirmed = json['confirmed'] as bool?
      ..groupTotal = (json['groupTotal'] as num?)?.toDouble()
      ..groupTopRecord = json['groupTopRecord'] as bool?
      ..filterDocumentTypes = (json['filterDocumentTypes'] as List<dynamic>?)
          ?.map((e) => _$enumDecode(_$DocumentTypeEnumMap, e))
          .toList()
      ..filterStartDate = json['filterStartDate'] as String?
      ..filterEndDate = json['filterEndDate'] as String?;

Map<String, dynamic> _$InvoiceToJson(Invoice instance) => <String, dynamic>{
      'id': instance.id,
      'documentNumber': instance.documentNumber,
      'documentDate': instance.documentDate,
      'quantity': instance.quantity,
      'vatRate': instance.vatRate,
      'divide': instance.divide,
      'confirmed': instance.confirmed,
      'groupTotal': instance.groupTotal,
      'groupTopRecord': instance.groupTopRecord,
      'filterDocumentTypes': instance.filterDocumentTypes
          ?.map((e) => _$DocumentTypeEnumMap[e])
          .toList(),
      'filterStartDate': instance.filterStartDate,
      'filterEndDate': instance.filterEndDate,
      'partnerDocumentNumber': instance.partnerDocumentNumber,
      'partnerDocumentDate': instance.partnerDocumentDate,
      'partnerDocumentDueDatePayment': instance.partnerDocumentDueDatePayment,
      'invoicePrice': instance.invoicePrice,
      'discountRate': instance.discountRate,
      'discountAmount': instance.discountAmount,
      'purchasePrice': instance.purchasePrice,
      'purchaseAmount': instance.purchaseAmount,
      'vatPurchaseAmount': instance.vatPurchaseAmount,
      'partnerDocumentAmount': instance.partnerDocumentAmount,
      'reimbursement': instance.reimbursement,
      'retailMargin': instance.retailMargin,
      'retailPrice': instance.retailPrice,
      'fzoRefPrice': instance.fzoRefPrice,
      'counterParty': instance.counterParty,
      'counterPartyPartnerId': instance.counterPartyPartnerId,
      'counterPartyPartnerName': instance.counterPartyPartnerName,
      'filterStartPartnerDocumentDate': instance.filterStartPartnerDocumentDate,
      'filterEndPartnerDocumentDate': instance.filterEndPartnerDocumentDate,
      'filterStartPartnerDocumentDueDatePayment':
          instance.filterStartPartnerDocumentDueDatePayment,
      'filterEndPartnerDocumentDueDatePayment':
          instance.filterEndPartnerDocumentDueDatePayment,
      'dtoType': _$DtoTypeEnumMap[instance.dtoType],
      'turnoverType': _$TurnoverTypeEnumMap[instance.turnoverType],
      'documentType': _$DocumentTypeEnumMap[instance.documentType],
      'product': instance.product,
      'account': instance.account,
      'pharmacy': instance.pharmacy,
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$DocumentTypeEnumMap = {
  DocumentType.FISCAL: 'FISCAL',
  DocumentType.FISCALSTOR: 'FISCALSTOR',
  DocumentType.INVOICEIN: 'INVOICEIN',
  DocumentType.INVOICEOUT: 'INVOICEOUT',
  DocumentType.INVOICEOUTSTOR: 'INVOICEOUTSTOR',
  DocumentType.INVOICESTOR: 'INVOICESTOR',
  DocumentType.INVOICEML: 'INVOICEML',
  DocumentType.INVOICEINT: 'INVOICEINT',
  DocumentType.INVOICEEL: 'INVOICEEL',
  DocumentType.INVENTORY: 'INVENTORY',
  DocumentType.TRANSFER: 'TRANSFER',
  DocumentType.PRICECHNG: 'PRICECHNG',
  DocumentType.INTERNALOUT: 'INTERNALOUT',
  DocumentType.INTERNALIN: 'INTERNALIN',
  DocumentType.INTERNALREIMBIN: 'INTERNALREIMBIN',
  DocumentType.INTERNALREIMBOUT: 'INTERNALREIMBOUT',
  DocumentType.DFI: 'DFI',
};

const _$TurnoverTypeEnumMap = {
  TurnoverType.C: 'C',
  TurnoverType.R: 'R',
  TurnoverType.O: 'O',
};

const _$DtoTypeEnumMap = {
  DtoType.FULL: 'FULL',
  DtoType.WITH_PRODUCT: 'WITH_PRODUCT',
  DtoType.NO_JOIN: 'NO_JOIN',
};
