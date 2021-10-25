// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'productdto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDto _$ProductDtoFromJson(Map<String, dynamic> json) => ProductDto(
      vatRate: (json['vatRate'] as num?)?.toDouble(),
      id: json['id'] as String?,
      active: json['active'] as bool?,
      atc7: json['atc7'] as String?,
      atc10: json['atc10'] as String?,
      commercialDivide: (json['commercialDivide'] as num?)?.toDouble(),
      description: json['description'] as String?,
      domesticProduct: json['domesticProduct'] as bool?,
      endActiveDate: json['endActiveDate'] as String?,
      eurolekCode: json['eurolekCode'] as String?,
      fzoProductCode: json['fzoProductCode'] as int?,
      fzoProductName: json['fzoProductName'] as String?,
      genericName: json['genericName'] as String?,
      integralCode: json['integralCode'] as String?,
      manufacturer: json['manufacturer'] == null
          ? null
          : PartnerDto.fromJson(json['manufacturer'] as Map<String, dynamic>),
      manufacturerProductName: json['manufacturerProductName'] as String?,
      mlCode: json['mlCode'] as String?,
      outputFzoRefPrice: (json['outputFzoRefPrice'] as num?)?.toDouble(),
      outputManufacturerName: json['outputManufacturerName'] as String?,
      outputRetailPrice: (json['outputRetailPrice'] as num?)?.toDouble(),
      outputStockCommQty: (json['outputStockCommQty'] as num?)?.toDouble(),
      outputTenderPrice: (json['outputTenderPrice'] as num?)?.toDouble(),
      packagesPerBox: (json['packagesPerBox'] as num?)?.toDouble(),
      packagingType:
          _$enumDecodeNullable(_$PackagingTypeEnumMap, json['packagingType']),
      packagingValue: json['packagingValue'] as int?,
      phoenixCode: json['phoenixCode'] as String?,
      piecesPerPackage: (json['piecesPerPackage'] as num?)?.toDouble(),
      productCode: json['productCode'] as String?,
      productName: json['productName'] as String?,
      productType:
          _$enumDecodeNullable(_$ProductTypeEnumMap, json['productType']),
      startActiveDate: json['startActiveDate'] as String?,
      supplier: json['supplier'] == null
          ? null
          : PartnerDto.fromJson(json['supplier'] as Map<String, dynamic>),
      uplId: json['uplId'] as int?,
      validated: json['validated'] as bool?,
      warrantyMonths: json['warrantyMonths'] as int?,
    );

Map<String, dynamic> _$ProductDtoToJson(ProductDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fzoProductCode': instance.fzoProductCode,
      'productName': instance.productName,
      'active': instance.active,
      'startActiveDate': instance.startActiveDate,
      'endActiveDate': instance.endActiveDate,
      'manufacturerProductName': instance.manufacturerProductName,
      'vatRate': instance.vatRate,
      'productType': _$ProductTypeEnumMap[instance.productType],
      'packagingType': _$PackagingTypeEnumMap[instance.packagingType],
      'packagingValue': instance.packagingValue,
      'piecesPerPackage': instance.piecesPerPackage,
      'packagesPerBox': instance.packagesPerBox,
      'commercialDivide': instance.commercialDivide,
      'fzoProductName': instance.fzoProductName,
      'genericName': instance.genericName,
      'atc7': instance.atc7,
      'atc10': instance.atc10,
      'description': instance.description,
      'productCode': instance.productCode,
      'uplId': instance.uplId,
      'domesticProduct': instance.domesticProduct,
      'validated': instance.validated,
      'phoenixCode': instance.phoenixCode,
      'mlCode': instance.mlCode,
      'integralCode': instance.integralCode,
      'eurolekCode': instance.eurolekCode,
      'warrantyMonths': instance.warrantyMonths,
      'manufacturer': instance.manufacturer,
      'supplier': instance.supplier,
      'outputManufacturerName': instance.outputManufacturerName,
      'outputStockCommQty': instance.outputStockCommQty,
      'outputRetailPrice': instance.outputRetailPrice,
      'outputTenderPrice': instance.outputTenderPrice,
      'outputFzoRefPrice': instance.outputFzoRefPrice,
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

const _$PackagingTypeEnumMap = {
  PackagingType.KUT: 'KUT',
  PackagingType.KOM: 'KOM',
  PackagingType.PAK: 'PAK',
};

const _$ProductTypeEnumMap = {
  ProductType.C: 'C',
  ProductType.L: 'L',
};
