import 'dart:core';

import 'package:json_annotation/json_annotation.dart';

part 'partnerdto.g.dart';

@JsonSerializable()
class PartnerDto {
  String? id;
  String? partnerName;
  String? country;
  bool? domestic;
  String? address;
  String? city;
  String? email;
  String? phone;

  PartnerDto(
      {this.id,
      this.partnerName,
      this.country,
      this.domestic,
      this.address,
      this.city,
      this.email,
      this.phone});

  factory PartnerDto.fromJson(Map<String, dynamic> data) =>
      _$PartnerDtoFromJson(data);

  Map<String, dynamic> toJson() => _$PartnerDtoToJson(this);
}
