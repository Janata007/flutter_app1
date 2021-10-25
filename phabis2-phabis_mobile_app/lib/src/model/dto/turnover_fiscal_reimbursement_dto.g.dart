// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'turnover_fiscal_reimbursement_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TurnoverFiscalReimbursementDto _$TurnoverFiscalReimbursementDtoFromJson(
        Map<String, dynamic> json) =>
    TurnoverFiscalReimbursementDto(
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
      paymentType:
          _$enumDecodeNullable(_$PaymentTypeEnumMap, json['paymentType']),
      firstName: json['firstName'] as String?,
      allergies: json['allergies'] as String?,
      dirtyId: json['dirtyId'] as String?,
      disabled: json['disabled'] as bool?,
      embg: json['embg'] as String?,
      embgHolder: json['embgHolder'] as String?,
      employerRegNumber: json['employerRegNumber'] as String?,
      expensive: json['expensive'] as bool?,
      ezbo: json['ezbo'] as String?,
      ezboHolder: json['ezboHolder'] as String?,
      facsimileRealization: json['facsimileRealization'] as int?,
      foreigner: json['foreigner'] as bool?,
      hic3RegionalService: json['hic3RegionalService'] as String?,
      hicNumber: json['hicNumber'] as String?,
      insuranceValidityDate: json['insuranceValidityDate'] as String?,
      invoiceNumber: json['invoiceNumber'] as String?,
      issuedDrugFzoCode: json['issuedDrugFzoCode'] as int?,
      issuedToNonPatient: json['issuedToNonPatient'] as bool?,
      issuedToNonPatientEmbg: json['issuedToNonPatientEmbg'] as String?,
      lastName: json['lastName'] as String?,
      municipalityCode: json['municipalityCode'] as String?,
      participationType: json['participationType'] as int?,
      pharmacyFzoCode: json['pharmacyFzoCode'] as String?,
      prescriptionDate: json['prescriptionDate'] as String?,
      prescriptionDrugIssueDate: json['prescriptionDrugIssueDate'] as String?,
      prescriptionNumber: json['prescriptionNumber'] as String?,
      prescriptionSerialNumber: json['prescriptionSerialNumber'] as int?,
      specificationNumber: json['specificationNumber'] as int?,
      specificationRank: json['specificationRank'] as int?,
      specificationType: json['specificationType'] as String?,
      therapyType: json['therapyType'] as String?,
      validityDateChronicTherapy: json['validityDateChronicTherapy'] as String?,
      vip: json['vip'] as bool?,
      yearMonth: json['yearMonth'] as String?,
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
      ..filterEndDate = json['filterEndDate'] as String?
      ..stornDocumentNumber = json['stornDocumentNumber'] as String?
      ..retailPrice = (json['retailPrice'] as num?)?.toDouble()
      ..retailAmount = (json['retailAmount'] as num?)?.toDouble()
      ..vatRetailAmount = (json['vatRetailAmount'] as num?)?.toDouble()
      ..fzoRefPricePc = (json['fzoRefPricePc'] as num?)?.toDouble()
      ..fzoRefPricePcWithVat =
          (json['fzoRefPricePcWithVat'] as num?)?.toDouble()
      ..bureauWholesalePrice =
          (json['bureauWholesalePrice'] as num?)?.toDouble()
      ..bureauRetailPrice = (json['bureauRetailPrice'] as num?)?.toDouble()
      ..fzoReferentPriceMargin =
          (json['fzoReferentPriceMargin'] as num?)?.toDouble()
      ..surcharge = (json['surcharge'] as num?)?.toDouble()
      ..participation = (json['participation'] as num?)?.toDouble()
      ..fzoRefPrice = (json['fzoRefPrice'] as num?)?.toDouble()
      ..calculatedParticipation =
          (json['calculatedParticipation'] as num?)?.toDouble()
      ..fiscalRegisterNumber = json['fiscalRegisterNumber'] as String?
      ..discount = (json['discount'] as num?)?.toDouble()
      ..tenderPrice = (json['tenderPrice'] as num?)?.toDouble()
      ..hiddenProduct = json['hiddenProduct'] as bool?
      ..successFiscal = json['successFiscal'] as bool?;

Map<String, dynamic> _$TurnoverFiscalReimbursementDtoToJson(
        TurnoverFiscalReimbursementDto instance) =>
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
      'issuedDrugFzoCode': instance.issuedDrugFzoCode,
      'hicNumber': instance.hicNumber,
      'embg': instance.embg,
      'ezbo': instance.ezbo,
      'employerRegNumber': instance.employerRegNumber,
      'embgHolder': instance.embgHolder,
      'ezboHolder': instance.ezboHolder,
      'municipalityCode': instance.municipalityCode,
      'prescriptionNumber': instance.prescriptionNumber,
      'prescriptionDate': instance.prescriptionDate,
      'prescriptionDrugIssueDate': instance.prescriptionDrugIssueDate,
      'therapyType': instance.therapyType,
      'participationType': instance.participationType,
      'pharmacyFzoCode': instance.pharmacyFzoCode,
      'foreigner': instance.foreigner,
      'allergies': instance.allergies,
      'hic3RegionalService': instance.hic3RegionalService,
      'validityDateChronicTherapy': instance.validityDateChronicTherapy,
      'insuranceValidityDate': instance.insuranceValidityDate,
      'expensive': instance.expensive,
      'yearMonth': instance.yearMonth,
      'invoiceNumber': instance.invoiceNumber,
      'specificationRank': instance.specificationRank,
      'specificationType': instance.specificationType,
      'specificationNumber': instance.specificationNumber,
      'prescriptionSerialNumber': instance.prescriptionSerialNumber,
      'disabled': instance.disabled,
      'dirtyId': instance.dirtyId,
      'facsimileRealization': instance.facsimileRealization,
      'vip': instance.vip,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'issuedToNonPatient': instance.issuedToNonPatient,
      'issuedToNonPatientEmbg': instance.issuedToNonPatientEmbg,
      'dtoType': _$DtoTypeEnumMap[instance.dtoType],
      'paymentType': _$PaymentTypeEnumMap[instance.paymentType],
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

const _$PaymentTypeEnumMap = {
  PaymentType.CASH: 'CASH',
  PaymentType.CARD: 'CARD',
};

const _$DtoTypeEnumMap = {
  DtoType.FULL: 'FULL',
  DtoType.WITH_PRODUCT: 'WITH_PRODUCT',
  DtoType.NO_JOIN: 'NO_JOIN',
};
