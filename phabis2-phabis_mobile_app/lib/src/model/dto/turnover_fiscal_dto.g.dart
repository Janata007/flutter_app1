// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'turnover_fiscal_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TurnoverFiscalDto _$TurnoverFiscalDtoFromJson(Map<String, dynamic> json) =>
    TurnoverFiscalDto(
      retailPrice: (json['retailPrice'] as num?)?.toDouble(),
      fzoRefPrice: (json['fzoRefPrice'] as num?)?.toDouble(),
      discount: (json['discount'] as num?)?.toDouble(),
      vatRetailAmount: (json['vatRetailAmount'] as num?)?.toDouble(),
      tenderPrice: (json['tenderPrice'] as num?)?.toDouble(),
      surcharge: (json['surcharge'] as num?)?.toDouble(),
      successFiscal: json['successFiscal'] as bool?,
      stornDocumentNumber: json['stornDocumentNumber'] as String?,
      retailAmount: (json['retailAmount'] as num?)?.toDouble(),
      participation: (json['participation'] as num?)?.toDouble(),
      hiddenProduct: json['hiddenProduct'] as bool?,
      fzoRefPricePcWithVat: (json['fzoRefPricePcWithVat'] as num?)?.toDouble(),
      fzoRefPricePc: (json['fzoRefPricePc'] as num?)?.toDouble(),
      fzoReferentPriceMargin:
          (json['fzoReferentPriceMargin'] as num?)?.toDouble(),
      fiscalRegisterNumber: json['fiscalRegisterNumber'] as String?,
      calculatedParticipation:
          (json['calculatedParticipation'] as num?)?.toDouble(),
      bureauWholesalePrice: (json['bureauWholesalePrice'] as num?)?.toDouble(),
      bureauRetailPrice: (json['bureauRetailPrice'] as num?)?.toDouble(),
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

Map<String, dynamic> _$TurnoverFiscalDtoToJson(TurnoverFiscalDto instance) =>
    <String, dynamic>{
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
      'stornDocumentNumber': instance.stornDocumentNumber,
      'retailPrice': instance.retailPrice,
      'retailAmount': instance.retailAmount,
      'vatRetailAmount': instance.vatRetailAmount,
      'fzoRefPricePc': instance.fzoRefPricePc,
      'fzoRefPricePcWithVat': instance.fzoRefPricePcWithVat,
      'bureauWholesalePrice': instance.bureauWholesalePrice,
      'bureauRetailPrice': instance.bureauRetailPrice,
      'fzoReferentPriceMargin': instance.fzoReferentPriceMargin,
      'surcharge': instance.surcharge,
      'participation': instance.participation,
      'fzoRefPrice': instance.fzoRefPrice,
      'calculatedParticipation': instance.calculatedParticipation,
      'fiscalRegisterNumber': instance.fiscalRegisterNumber,
      'discount': instance.discount,
      'tenderPrice': instance.tenderPrice,
      'hiddenProduct': instance.hiddenProduct,
      'successFiscal': instance.successFiscal,
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
