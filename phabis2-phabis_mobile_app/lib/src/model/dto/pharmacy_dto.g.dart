// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pharmacy_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PharmacyDto _$PharmacyDtoFromJson(Map<String, dynamic> json) => PharmacyDto(
      id: json['id'] as int?,
      city: json['city'] as String?,
      address: json['address'] as String?,
      healthFacilityCode: json['healthFacilityCode'] as int?,
      pharmacyName: json['pharmacyName'] as String?,
      vatNumber: json['vatNumber'] as String?,
    );

Map<String, dynamic> _$PharmacyDtoToJson(PharmacyDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'pharmacyName': instance.pharmacyName,
      'address': instance.address,
      'city': instance.city,
      'vatNumber': instance.vatNumber,
      'healthFacilityCode': instance.healthFacilityCode,
    };
