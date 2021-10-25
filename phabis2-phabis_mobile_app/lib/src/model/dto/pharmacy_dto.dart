import 'package:json_annotation/json_annotation.dart';

part 'pharmacy_dto.g.dart';

@JsonSerializable()
class PharmacyDto {
  int? id; //phabis2 original type is Long
  String? pharmacyName;
  String? address;
  String? city;
  String? vatNumber; //danocen broj
  int? healthFacilityCode;

  PharmacyDto({
    this.id,
    this.city,
    this.address,
    this.healthFacilityCode,
    this.pharmacyName,
    this.vatNumber,
  });

  factory PharmacyDto.fromJson(Map<String, dynamic> data) =>
      _$PharmacyDtoFromJson(data);

  Map<String, dynamic> toJson() => _$PharmacyDtoToJson(this);
}
